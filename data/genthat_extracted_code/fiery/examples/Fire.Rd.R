library(fiery)


### Name: Fire
### Title: Generate a New App Object
### Aliases: Fire
### Keywords: datasets

### ** Examples

# Create a New App
app <- Fire$new(port = 4689)

# Setup the data every time it starts
app$on('start', function(server, ...) {
    server$set_data('visits', 0)
    server$set_data('cycles', 0)
})

# Count the number of cycles
app$on('cycle-start', function(server, ...) {
    server$set_data('cycles', server$get_data('cycles') + 1)
})

# Count the number of requests
app$on('before-request', function(server, ...) {
    server$set_data('visits', server$get_data('visits') + 1)
})

# Handle requests
app$on('request', function(server, ...) {
    list(
        status = 200L,
        headers = list('Content-Type' = 'text/html'),
        body = paste('This is indeed a test. You are number', server$get_data('visits'))
    )
})

# Show number of requests in the console
app$on('after-request', function(server, ...) {
    message(server$get_data('visits'))
    flush.console()
})

# Terminate the server after 300 cycles
app$on('cycle-end', function(server, ...) {
    if (server$get_data('cycles') > 300) {
        message('Ending...')
        flush.console()
        server$extinguish()
    }
})

# Be polite
app$on('end', function(server) {
    message('Goodbye')
    flush.console()
})

## Not run: 
##D app$ignite(showcase = TRUE)
## End(Not run)




