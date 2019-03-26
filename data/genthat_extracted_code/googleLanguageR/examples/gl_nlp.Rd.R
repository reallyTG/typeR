library(googleLanguageR)


### Name: gl_nlp
### Title: Perform Natural Language Analysis
### Aliases: gl_nlp

### ** Examples


## Not run: 
##D 
##D text <- "to administer medicince to animals is frequently a very difficult matter,
##D   and yet sometimes it's necessary to do so"
##D nlp <- gl_nlp(text)
##D 
##D nlp$sentences
##D 
##D nlp$tokens
##D 
##D nlp$entities
##D 
##D nlp$documentSentiment
##D 
##D ## vectorised input
##D texts <- c("The cat sat one the mat", "oh no it didn't you fool")
##D nlp_results <- gl_nlp(texts)
##D 
##D 
##D 
## End(Not run)




