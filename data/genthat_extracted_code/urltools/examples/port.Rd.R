library(urltools)


### Name: port
### Title: Get or set a URL's port
### Aliases: port port<-

### ** Examples

# Get the port
example_url <- "http://cran.r-project.org:80/submit.html"
port(example_url)

# Set the port
port(example_url) <- "12"

# Remove the port
port(example_url) <- NULL



