library(opensensmapr)


### Name: osem_measurements
### Title: Fetch the Measurements of a Phenomenon on opensensemap.org
### Aliases: osem_measurements osem_measurements.default
###   osem_measurements.bbox osem_measurements.sensebox

### ** Examples

## No test: 
  # get measurements from all boxes on the phenomenon 'PM10' from the last 48h
  m = osem_measurements('PM10')

  # get measurements from all mobile boxes on the phenomenon 'PM10' from the last 48h
  m = osem_measurements('PM10', exposure = 'mobile')

  # get measurements and cache them locally in the working directory.
  # subsequent identical requests will load from the cache instead, ensuring
  # reproducibility and saving time and bandwidth!
  m = osem_measurements('PM10', exposure = 'mobile', cache = getwd())
  m = osem_measurements('PM10', exposure = 'mobile', cache = getwd())

  # get measurements returning a custom selection of columns
  m = osem_measurements('PM10', exposure = 'mobile', columns = c(
    'value',
    'boxId',
    'sensorType',
    'lat',
    'lon',
    'height'
  ))
## End(No test)
## No test: 
  # get measurements from sensors within a custom WGS84 bounding box
  bbox = structure(c(7, 51, 8, 52), class = 'bbox')
  m = osem_measurements(bbox, 'Temperatur')

  # construct a bounding box 12km around berlin using the sf package,
  # and get measurements from stations within that box
  library(sf)
  bbox2 = st_point(c(13.4034, 52.5120)) %>%
    st_sfc(crs = 4326) %>%
    st_transform(3857) %>% # allow setting a buffer in meters
    st_buffer(set_units(12, km)) %>%
    st_transform(4326) %>% # the opensensemap expects WGS 84
    st_bbox()
  m = osem_measurements(bbox2, 'Temperatur', exposure = 'outdoor')

  # construct a bounding box from two points,
  # and get measurements from stations within that box
  points = st_multipoint(matrix(c(7.5, 7.8, 51.7, 52), 2, 2))
  bbox3 = st_bbox(points)
  m = osem_measurements(bbox2, 'Temperatur', exposure = 'outdoor')
## End(No test)
## No test: 
  # get measurements from a set of boxes
  b = osem_boxes(grouptag = 'ifgi')
  m4 = osem_measurements(b, phenomenon = 'Temperatur')

  # ...or a single box
  b = osem_box('57000b8745fd40c8196ad04c')
  m5 = osem_measurements(b, phenomenon = 'Temperatur')

  # get measurements from a single box on the from the last 40 days.
  # requests are paged for long time frames, so the APIs limitation
  # does not apply!
  library(lubridate)
  m1 = osem_measurements(
    b,
    'Temperatur',
    to = now(),
    from = now() - days(40)
  )
## End(No test)



