library(echor)


### Name: echoAirGetFacilityInfo
### Title: Downloads EPA ECHO permitted air emitter information
### Aliases: echoAirGetFacilityInfo

### ** Examples

## No test: 
## These examples require an internet connection to run

## Retrieve table of facilities by bounding box
echoAirGetFacilityInfo(xmin = '-96.407563',
ymin = '30.554395',
xmax = '-96.25947',
ymax = '30.751984',
output = 'df')

## Retrieve a simple features dataframe by bounding box
spatialdata <- echoAirGetFacilityInfo(xmin = '-96.407563',
ymin = '30.554395',
xmax = '-96.25947',
ymax = '30.751984',
output = 'sf')

## End(No test)



