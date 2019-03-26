library(quanteda)


### Name: convert
### Title: Convert a dfm to a non-quanteda format
### Aliases: convert

### ** Examples

mycorpus <- corpus_subset(data_corpus_inaugural, Year > 1970)
quantdfm <- dfm(mycorpus, verbose = FALSE)

# austin's wfm format
identical(dim(quantdfm), dim(convert(quantdfm, to = "austin")))

# stm package format
stmdfm <- convert(quantdfm, to = "stm")
str(stmdfm)

#' # triplet
triplet <- convert(quantdfm, to = "tripletlist")
str(triplet)

# illustrate what happens with zero-length documents
quantdfm2 <- dfm(c(punctOnly = "!!!", mycorpus[-1]), verbose = FALSE)
rowSums(quantdfm2)
stmdfm2 <- convert(quantdfm2, to = "stm", docvars = docvars(mycorpus))
str(stmdfm2)

## Not run: 
##D # tm's DocumentTermMatrix format
##D tmdfm <- convert(quantdfm, to = "tm")
##D str(tmdfm)
##D 
##D # topicmodels package format
##D str(convert(quantdfm, to = "topicmodels"))
##D 
##D # lda package format
##D ldadfm <- convert(quantdfm, to = "lda")
##D str(ldadfm)
##D 
## End(Not run)



