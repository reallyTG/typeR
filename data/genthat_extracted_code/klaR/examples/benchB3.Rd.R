library(klaR)


### Name: benchB3
### Title: Benchmarking on B3 data
### Aliases: benchB3
### Keywords: classif

### ** Examples

perLDA <- benchB3("lda")
## Not run: 
##D ## due to parameter optimization rda takes a while 
##D perRDA <- benchB3("rda")
##D library(rpart)
##D ## rpart will not work with prior argument:
##D perRpart <- benchB3("rpart", prior = NULL)
## End(Not run)



