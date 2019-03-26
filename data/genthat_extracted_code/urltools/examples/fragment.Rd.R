library(urltools)


### Name: fragment
### Title: Get or set a URL's fragment
### Aliases: fragment fragment<-

### ** Examples

#Get a component
example_url <- "http://en.wikipedia.org/wiki/Aaron_Halfaker?debug=true#test"
fragment(example_url)

#Set a component
fragment(example_url) <- "production"

#Remove a component
fragment(example_url) <- NULL



