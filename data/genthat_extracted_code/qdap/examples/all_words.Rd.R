library(qdap)


### Name: all_words
### Title: Searches Text Column for Words
### Aliases: all_words

### ** Examples

## Not run: 
##D x1 <- all_words(raj$dialogue, begins.with="re")
##D head(x1, 10)
##D x2 <- all_words(raj$dialogue, "q")
##D head(x2, 10)
##D all_words(raj$dialogue, contains="conc")
##D x3 <- all_words(raj$dialogue)
##D head(x3, 10)
##D x4 <- all_words(raj$dialogue, contains="the")
##D head(x4)
##D x5 <- all_words(raj$dialogue, contains="read")
##D head(x5)
##D 
##D ## Filter by nchar and stopwords
##D Filter(head(x3), min = 3)
##D 
##D ## Keep spaces
##D all_words(space_fill(DATA$state, c("are you", "can be")))
## End(Not run)



