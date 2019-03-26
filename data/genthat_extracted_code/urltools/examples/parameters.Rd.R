library(urltools)


### Name: parameters
### Title: Get or set a URL's parameters
### Aliases: parameters parameters<-

### ** Examples

# Get the parameters
example_url <- "http://en.wikipedia.org/wiki/Aaron_Halfaker?debug=true"
parameters(example_url)

# Set the parameters
parameters(example_url) <- "debug=false"

# Remove the parameters
parameters(example_url) <- NULL



