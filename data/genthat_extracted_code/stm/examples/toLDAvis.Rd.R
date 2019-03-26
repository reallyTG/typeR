library(stm)


### Name: toLDAvis
### Title: Wrapper to launch LDAvis topic browser.
### Aliases: toLDAvis

### ** Examples


## Not run: 
##D 
##D mod <- stm(poliblog5k.docs, poliblog5k.voc, K=25,
##D            prevalence=~rating, data=poliblog5k.meta,
##D            max.em.its=2, init.type="Spectral") 
##D #please don't run a model with 2 iterations
##D #this is done here to make it run quickly.
##D toLDAvis(mod=mod, docs=poliblog5k.docs)
##D 
## End(Not run)



