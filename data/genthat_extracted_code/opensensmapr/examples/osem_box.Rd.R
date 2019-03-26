library(opensensmapr)


### Name: osem_box
### Title: Get a single senseBox by its ID
### Aliases: osem_box

### ** Examples

## No test: 
  # get a specific box by ID
  b = osem_box('57000b8745fd40c8196ad04c')

  # get a specific box by ID from a custom (selfhosted) openSenseMap API
  b = osem_box('51030b8725fd30c2196277da', 'http://api.my-custom-osem.com')

  # get a specific box by ID and cache the response, in order to provide
  # reproducible results in the future.
  b = osem_box('51030b8725fd30c2196277da', cache = tempdir())
## End(No test)



