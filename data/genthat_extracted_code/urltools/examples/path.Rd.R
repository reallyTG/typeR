library(urltools)


### Name: path
### Title: Get or set a URL's path
### Aliases: path path<-

### ** Examples

# Get the path
example_url <- "http://cran.r-project.org:80/submit.html"
path(example_url)

# Set the path
path(example_url) <- "bin/windows/"

# Remove the path
path(example_url) <- NULL



