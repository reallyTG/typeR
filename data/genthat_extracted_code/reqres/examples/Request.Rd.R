library(reqres)


### Name: Request
### Title: HTTP Request Handling
### Aliases: Request as.Request is.Request
### Keywords: datasets

### ** Examples

fake_rook <- fiery::fake_request(
  'http://example.com/test?id=34632&question=who+is+hadley',
  content = 'This is an elaborate ruse',
  headers = list(
    Accept = 'application/json; text/*',
    Content_Type = 'text/plain'
  )
)

req <- Request$new(fake_rook)

# Get full URL
req$url

# Get list of query parameters
req$query

# Test if content is text
req$is('txt')

# Perform content negotiation for the response
req$accepts(c('html', 'json', 'txt'))

# Cleaning up connections
rm(fake_rook, req)
gc()




