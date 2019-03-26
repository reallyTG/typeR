library(routr)


### Name: Route
### Title: Create a route for dispatching on URL
### Aliases: Route
### Keywords: datasets

### ** Examples

# Initialise an empty route
route <- Route$new()

# Initialise a route with handlers assigned
route <- Route$new(
  all = list(
    '/*' = function(request, response, keys, ...) {
      message('Request recieved')
      TRUE
    }
  )
)

# Remove it again
route$remove_handler('all', '/*')




