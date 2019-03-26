library(urltools)


### Name: scheme
### Title: Get or set a URL's scheme
### Aliases: scheme scheme<-

### ** Examples

#Get a component
example_url <- "http://cran.r-project.org/submit.html"
scheme(example_url)

#Set a component
scheme(example_url) <- "https"

# NA out the URL
scheme(example_url) <- NA_character_



