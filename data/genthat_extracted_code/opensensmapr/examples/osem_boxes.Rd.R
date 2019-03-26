library(opensensmapr)


### Name: osem_boxes
### Title: Get a set of senseBoxes from the openSenseMap
### Aliases: osem_boxes

### ** Examples


## No test: 
  # get *all* boxes available on the API
  b = osem_boxes()

  # get all boxes with grouptag 'ifgi' that are placed outdoors
  b = osem_boxes(grouptag = 'ifgi', exposure = 'outdoor')

  # get all boxes with model 'luftdaten_sds011_dht22'
  b = osem_boxes(grouptag = 'ifgi')

  # get all boxes that have measured PM2.5 in the last 4 hours
  b = osem_boxes(date = Sys.time(), phenomenon = 'PM2.5')

  # get all boxes that have measured PM2.5 between Jan & Feb 2018
  library(lubridate)
  b = osem_boxes(
    from = date('2018-01-01'),
    to = date('2018-02-01'),
    phenomenon = 'PM2.5'
  )

  # get all boxes from a custom (selfhosted) openSenseMap API
  b = osem_box(endpoint = 'http://api.my-custom-osem.com')

  # get all boxes and cache the response, in order to provide
  # reproducible results in the future. Also useful for development
  # to avoid repeated loading times!
  b = osem_boxes(cache = getwd())
  b = osem_boxes(cache = getwd())

  # get *all* boxes available on the API, without showing download progress
  b = osem_boxes(progress = FALSE)
## End(No test)



