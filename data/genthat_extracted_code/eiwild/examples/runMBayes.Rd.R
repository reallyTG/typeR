library(eiwild)


### Name: runMBayes
### Title: Metropolis Algorithm for ecological Inference
### Aliases: runMBayes

### ** Examples

## Not run: 
##D # loading some fake election data
##D data(topleveldat)
##D form <- cbind(CSU_2, SPD_2, LINK_2, GRUN_2) ~ cbind(CSU_1, SPD_1, Link_1)
##D conv <- convertEiData(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"))
##D set.seed(1234)
##D res <- runMBayes(conv, sample=1000, thinning=2, burnin=100,verbose=100)
##D 
##D ## !!! not an eiwild object !!!
##D class(res)
##D 
##D # better to use indAggEi
##D set.seed(12345)
##D res2 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                  sample=1000, thinning=2, burnin=100,verbose=100)
##D class(res2)
##D summary(res2)
##D 
##D # with individual alpha-hyperpriori-parameters
##D hypMat <- list(shape = matrix(c(30,4,4,4,
##D                                 4,30,4,4,
##D                                 4,4,30,4), nrow=3, ncol=4, byrow=TRUE),
##D                rate = matrix(c(1,2,2,2,
##D                                2,1,2,2,
##D                                2,2,1,2), nrow=3, ncol=4, byrow=TRUE))
##D set.seed(12345)
##D res2 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                  sample=1000, thinning=2, burnin=100, verbose=100,
##D                  prioriPars=hypMat, whichPriori="gamma")
## End(Not run)



