library(stm)


### Name: poliblog5k
### Title: CMU 2008 Political Blog Corpus
### Aliases: poliblog5k poliblog5k.docs poliblog5k.voc poliblog5k.meta
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D data(poliblog5k)
##D head(poliblog5k.meta)
##D head(poliblog5k.voc)
##D 
##D stm1 <- stm(poliblog5k.docs, poliblog5k.voc, 3,
##D prevalence=~rating, data=poliblog5k.meta)
## End(Not run)




