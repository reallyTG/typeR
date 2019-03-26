library(routr)


### Name: sizelimit_route
### Title: Limit the size of requests
### Aliases: sizelimit_route

### ** Examples

limit_route <- sizelimit_route() # Default 5Mb limit
rook <- fiery::fake_request('http://www.example.com', 'post',
                            headers = list(Content_Length = 30*1024^2))
req <- reqres::Request$new(rook)
limit_route$dispatch(req)
req$respond()




