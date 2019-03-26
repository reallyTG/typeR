library(routr)


### Name: RouteStack
### Title: Combine multiple routes for sequential routing
### Aliases: RouteStack
### Keywords: datasets

### ** Examples

# Create a new stack
routes <- RouteStack$new()

# Populate it wih routes
first <- Route$new()
first$add_handler('all', '*', function(request, response, keys, ...) {
  message('This will always get called first')
  TRUE
})
second <- Route$new()
second$add_handler('get', '/demo/', function(request, response, keys, ...) {
  message('This will get called next if the request asks for /demo/')
  TRUE
})
routes$add_route(first, 'first')
routes$add_route(second, 'second')

# Send a request through
rook <- fiery::fake_request('http://example.com/demo/', method = 'get')
req <- reqres::Request$new(rook)
routes$dispatch(req)




