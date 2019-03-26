library(qlcMatrix)


### Name: splitStrings
### Title: Construct unigram and bigram matrices from a vector of strings
### Aliases: splitStrings

### ** Examples

# a simple example to see the function at work
example <- c("this","is","an","example")
splitStrings(example)
splitStrings(example, simplify = TRUE)

## Not run: 
##D # a bit larger, but still quick and efficient
##D # taking 15526 wordforms from the English Dalby Bible and splitting them into bigrams
##D data(bibles)
##D words <- splitText(bibles$eng)$wordforms
##D system.time( S <- splitStrings(words, simplify = TRUE) )
##D 
##D # and then taking the cosine similarity between the bigram-vectors for all word pairs
##D system.time( sim <- cosSparse(S) )
##D 
##D # most similar words to "father"
##D sort(sim["father",], decreasing = TRUE)[1:20]
## End(Not run)



