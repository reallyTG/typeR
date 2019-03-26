library(fiery)


### Name: fake_request
### Title: Create a fake request to use in testing
### Aliases: fake_request
### Keywords: internal

### ** Examples

req <- fake_request(
    'http://www.my-fake-website.com/path/to/a/query/?key=value&key2=value2',
    content = 'Some important content'
)

# Get the main address of the URL
req[['SERVER_NAME']]

# Get the query string
req[['QUERY_STRING']]

# ... etc.

# Cleaning up connections
rm(req)
gc()




