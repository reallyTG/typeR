## ----setup, results='hide'-----------------------------------------------
# this vignette requires:
library(opensensmapr)
library(jsonlite)
library(readr)

## ----cache---------------------------------------------------------------
b = osem_boxes(grouptag = 'ifgi', cache = tempdir())

# the next identical request will hit the cache only!
b = osem_boxes(grouptag = 'ifgi', cache = tempdir())

# requests without the cache parameter will still be performed normally
b = osem_boxes(grouptag = 'ifgi')

## ----cachelisting--------------------------------------------------------
list.files(tempdir(), pattern = 'osemcache\\..*\\.rds')

## ----cache_custom--------------------------------------------------------
cacheDir = getwd() # current working directory
b = osem_boxes(grouptag = 'ifgi', cache = cacheDir)

# the next identical request will hit the cache only!
b = osem_boxes(grouptag = 'ifgi', cache = cacheDir)

## ----clearcache, results='hide'------------------------------------------
osem_clear_cache()        # clears default cache
osem_clear_cache(getwd()) # clears a custom cache

## ----data, results='hide'------------------------------------------------
# first get our example data:
measurements = osem_measurements('Windgeschwindigkeit')

## ----serialize_json------------------------------------------------------
# serializing senseBoxes to JSON, and loading from file again:
write(jsonlite::serializeJSON(measurements), 'measurements.json')
measurements_from_file = jsonlite::unserializeJSON(readr::read_file('measurements.json'))
class(measurements_from_file)

## ----serialize_attrs-----------------------------------------------------
# note the toJSON call instead of serializeJSON
write(jsonlite::toJSON(measurements), 'measurements_bad.json')
measurements_without_attrs = jsonlite::fromJSON('measurements_bad.json')
class(measurements_without_attrs)

measurements_with_attrs = osem_as_measurements(measurements_without_attrs)
class(measurements_with_attrs)

## ----cleanup, include=FALSE----------------------------------------------
file.remove('measurements.json', 'measurements_bad.json')

