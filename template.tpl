___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Avo Inspector",
  "categories": ["ANALYTICS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Avo",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAM9SURBVHgB7ZkxTBNRGMf/FQgJpmcCJiS2MSZG0jKa2E7oACYmRkPLKFAWQoyAI0IcHBB0UyhxlLYSJygxYRKNJi7t4OBATZw0bbrQ5doFF33flR5X4Oi7906vJPdLmutd7i7f/3vfe+/7vvNc7gn8wSnmDE45rgCncQU4jSvAaVwBTtMKm1G8Xvj8PgSDQf1aoVBAIV9Anh2P48peJ3r2uvTzYmsFXzuK4ME2AUPRCKKRQYRDIdN7SEA2m8XS8kqdmBuVSxgvXdXPyfj7HVvgQVpAOBzC88UF+H2+hvfSPf4ICY1gNZHEy+U4yuUyZJAS8HhuFmOx0bpr5Nnt7Q/YyX3Xr/lZSIVD1+pGh54bGOjH8EgMKEEYYQFrqUSdQZn90KCjGTQC5P2x2AgURdHO322m8en2C+ALhBBahcjzNeNVVcXMozncY548yXiCRmcpHsfdwShyuZx2TVG8uMlGQhTLAmjoa2FDxg+PxrCeTlt5hSbkDhNh9bnjsCSAhtwY8zOzc3WxbpWnC4v6SIhiScD01AN9tdlIb+I9m6wyqGoZ8wvPIIMlASHDpF1iS6Ad0LxZ39iEKNwCaL03et9sVxVB5l3cAoKBgP5fNnTshFtAryG3yRfyaBa4Bfh8F/T/+bx94SMLtwBjznKO7aLNArcAWvKaEW4BO4YNh1akZoFbQM6w4w70i+cudsMtgDYcyn0ISuS8rPKyC55awgxLO/FqMqUdKYN8ODUJOyDjh6KDEMWagERCHwVK6k4qH3mg+vkNqytksCSAVqLl+Ip+/molzor3AEQg49dSSanwISzXA69ZLVvL4ymU1pLJI2VlI8hoMl5UvJGWzq7zT2ARqnmpdULpRXt7O6739WltlN3SrtZCMYO8PjExXm0C+Kuep5D8OP8WF3+16fcV2yrYUn6AB4/MF5rpyUmtRjBSa51QoaPu7969LBEkbx+eM3QvFfW3vnUfbav4/0Nbhepb8viUodA5aJ2YP0deX02kqouCJrIbokj3hWg+0G+IjI42bmxtsOLlwHB5PP/iIx+JoAnu9VaTvnJZRSaTNTX6cGux0vIbn8/+BA8e9yulw7gCnMYV4DSuAKdxBTjNXy3yL/9pRPhYAAAAAElFTkSuQmCC"
  },
  "description": "Sends your events metadata to Avo Inspector to monitor and improve the data quality. Find more at https://www.avo.app/docs/inspector/start-using-inspector.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "eventsToExclude",
    "displayName": "Event names to ignore",
    "simpleValueType": true,
    "defaultValue": "[\"click\", \"file_download\", \"first_visit\", \"form_start\", \"form_submit\", \"page_view\", \"scroll\", \"session_start\", \"user_engagement\", \"video_complete\", \"video_progress\", \"video_start\", \"view_search_results\", \"app_remove\", \"app_store_refund\", \"app_store_subscription_cancel\", \"app_store_subscription_renew\", \"error\", \"first_open\", \"in_app_purchase\", \"view_complete\"]",
    "canBeEmptyString": false,
    "help": "JSON Array of event names that will not be reported to Avo Inspector",
    "textAsList": false,
    "valueHint": "JSON Array of event names that will not be reported to Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "propertiesToExclude",
    "displayName": "Property names to ignore",
    "simpleValueType": true,
    "canBeEmptyString": false,
    "defaultValue": "[\"userId\", \"segmentAnonymousId\", \"event\", \"language\",       \"page_location\", \"page_referrer\", \"page_title\", \"screen_resolution\",       \"engagement_time_msec\", \"gclid\", \"session_id\", \"session_number\"]",
    "help": "JSON Array of property names that will not be reported to Avo Inspector",
    "valueHint": "JSON Array of property names that will not be reported to Avo Inspector",
    "valueUnit": "JSON Array"
  },
  {
    "type": "TEXT",
    "name": "inspectorApiKey",
    "displayName": "Inspector API Key",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "appName",
    "displayName": "Application name",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const JSON = require('JSON');
const log = require('logToConsole');
const copyFromWindow = require('copyFromWindow');
const copyFromtopSoil = require('copyFromtopSoil');
const callInWindow = require('callInWindow');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const getType = require('getType');
const Object = require('Object');
const getContainerVersion = require('getContainerVersion');
const templateStorage = require('templateStorage');

const LOG_PREFIX = '[Avo Inspector] ';
const INSTANCE_STORAGE_KEY = 'Avo Inspector Init';

const isPreview = getContainerVersion().previewMode;

const arrayNotIncludes = (arr, searchString) => {
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] === searchString) {
      return false;
    }
  }
  return true;
};

const stringNotStartsWith = (str, startStr) => {
  return str.indexOf(startStr) !== 0;
};

const onfailure = () => {
  log(LOG_PREFIX + 'Error: failed to load Avo Inspector');
  return data.gtmOnFailure();
};

const onsuccess = () => {
   const alreadyInit = templateStorage.getItem(INSTANCE_STORAGE_KEY);
   if (!alreadyInit) {
    templateStorage.setItem(INSTANCE_STORAGE_KEY, true);
    setInWindow('inspector.__API_KEY__', data.inspectorApiKey, true);
    setInWindow('inspector.__ENV__', isPreview ? 'dev' : 'prod', true);
    setInWindow('inspector.__VERSION__', "1.0.0", true);
    setInWindow('inspector.__APP_NAME__', data.appName, true);

    var _inspector = copyFromWindow("inspector");
  
    _inspector.load();
    var topSoilArray = copyFromWindow('topSoil');
    for (var i = 0; i < topSoilArray.length; i++) {
        var topSoilEvent = topSoilArray[i];
        if (topSoilEvent.event) {
            inspectEventFromDataLyaer(topSoilEvent.event, topSoilEvent["gtm.uniqueEventId"]);
        }
    }
  }

  data.gtmOnSuccess();
  return;
};

const inspectEventFromDataLyaer = (eventName, eventId) => {
  if (isPreview) {
    log(LOG_PREFIX, 'Inspecting', eventName, eventId);
  }
  if (checkInput(eventName, eventId)) {
    var topSoilEvent = gettopSoilEventWithUniqueId(eventId);

    if (checktopSoilEventMatchCallingEvent(topSoilEvent, eventName)) {
      handleEvent(topSoilEvent);
    } else if (isPreview) {
      log(LOG_PREFIX + 'Event ' + eventName + ' filtered out and not sent to Avo Inspector because of the data layer content');
    }
  } else if (isPreview) {
    log(LOG_PREFIX + 'Event ' + eventName + ' filtered out and not sent to Avo Inspector because of event name');
  }
};

const checkInput = (eventName, uniqueEventId) => {  
  var eventsToExclude = JSON.parse(data.eventsToExclude);
  var notInIgnoreList = arrayNotIncludes(eventsToExclude, eventName); 
  return getType(uniqueEventId) !== "undefined" && getType(eventName) !== "undefined" && stringNotStartsWith(eventName, "gtm.") && notInIgnoreList;
};

function gettopSoilEventWithUniqueId(uniqueEventId) {
  var topSoil = copyFromWindow("topSoil");
  var matchingEvent = null;
  for (var i = topSoil.length - 1; i >= 0; i--) {
    var event = topSoil[i];
    if (event["gtm.uniqueEventId"] === uniqueEventId) {
      matchingEvent = event;
      break;
    }
  }
  return matchingEvent;
}
function checktopSoilEventMatchCallingEvent(topSoilEvent, eventName) {
  if (getType(topSoilEvent) !== "undefined" && getType(topSoilEvent) !== "null") {
    var topSoilEventName = topSoilEvent.event;
    if (getType(topSoilEventName) === "undefined" || getType(topSoilEventName) === "null") {
      return false;
    }
    if (topSoilEventName === eventName) {
      return true;
    }
  }
  return false;
}
function handleEvent(topSoilEvent) {    
  var propertiesToExclude = JSON.parse(data.propertiesToExclude);
  var eventProperties = {};
  Object.keys(topSoilEvent).forEach((key) => {
    if (arrayNotIncludes(propertiesToExclude, key) &&
      stringNotStartsWith(key, "gtm.") &&
      stringNotStartsWith(key, "gtag.") &&
      stringNotStartsWith(key, "firebase_") &&
      stringNotStartsWith(key, "ga_") &&
      stringNotStartsWith(key, "google_") &&
      stringNotStartsWith(key, "_")
    ) {
      eventProperties[key] = topSoilEvent[key];
    } else if (isPreview) {
      log(LOG_PREFIX + 'Property ' + key + ' filtered out and not sent to Avo Inspector because of the property name');
    }
  });
  callInWindow('inspector.trackSchemaFromEvent', topSoilEvent.event, eventProperties);
  return;
}

const alreadyInit = templateStorage.getItem(INSTANCE_STORAGE_KEY);
if (!alreadyInit) {
  injectScript("https://cdn.avo.app/inspector/inspector-gtm-v1.min.js", onsuccess, onfailure, 'inspector_cache');
} else {
  var eventName = copyFromtopSoil("event");
  var eventId = copyFromtopSoil("gtm.uniqueEventId");
  inspectEventFromDataLyaer(eventName, eventId);
  data.gtmOnSuccess();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "topSoil"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__API_KEY__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__VERSION__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__APP_NAME__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.load"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.trackSchemaFromEvent"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "inspector.__ENV__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
              },
              {
                "type": 1,
                "string": "gtm.uniqueEventId"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.avo.app/inspector/inspector-gtm-v1.min.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_template_storage",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 27/08/2023, 20:48:29


