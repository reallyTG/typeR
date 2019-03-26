library(qdap)


### Name: word_proximity
### Title: Proximity Matrix Between Words
### Aliases: word_proximity weight.word_proximity

### ** Examples

## Not run: 
##D wrds <- word_list(pres_debates2012$dialogue, 
##D     stopwords = c("it's", "that's", Top200Words))
##D wrds2 <- tolower(sort(wrds$rfswl[[1]][, 1]))
##D 
##D (x <- with(pres_debates2012, word_proximity(dialogue, wrds2)))
##D plot(x)
##D plot(weight(x))
##D plot(weight(x, "rev_scale_log"))
##D 
##D (x2 <- with(pres_debates2012, word_proximity(dialogue, wrds2, person)))
##D 
##D ## The spaces around `terms` are important
##D (x3 <- with(DATA, word_proximity(state, spaste(qcv(the, i)))))
##D (x4 <- with(DATA, word_proximity(state, qcv(the, i))))
## End(Not run)



