library(qdap)


### Name: bag_o_words
### Title: Bag of Words
### Aliases: bag_o_words unbag breaker word_split
### Keywords: bag-of-words

### ** Examples

## Not run: 
##D bag_o_words("I'm going home!")
##D bag_o_words("I'm going home!", apostrophe.remove = TRUE)
##D unbag(bag_o_words("I'm going home!"))
##D 
##D bag_o_words(DATA$state)
##D by(DATA$state, DATA$person, bag_o_words)
##D lapply(DATA$state,  bag_o_words)
##D 
##D breaker(DATA$state)
##D by(DATA$state, DATA$person, breaker)
##D lapply(DATA$state,  breaker)
##D unbag(breaker(DATA$state))
##D 
##D word_split(c(NA, DATA$state))
##D unbag(word_split(c(NA, DATA$state)))
## End(Not run)



