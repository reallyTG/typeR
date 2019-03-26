library(routr)


### Name: ressource_route
### Title: Create a route for fetching files
### Aliases: ressource_route

### ** Examples

# Map package files
res_route <- ressource_route(
  '/package_files/' = system.file(package = 'routr')
)

rook <- fiery::fake_request('http://example.com/package_files/DESCRIPTION')
req <- reqres::Request$new(rook)
res_route$dispatch(req)
req$response$as_list()



