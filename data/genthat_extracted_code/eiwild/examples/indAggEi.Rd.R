library(eiwild)


### Name: indAggEi
### Title: Ecological Inference including Individual Data
### Aliases: class-eiwild indAggEi

### ** Examples

## Not run: 
##D # loading some fake election data
##D data(topleveldat)
##D form <- cbind(CSU_2, SPD_2, LINK_2, GRUN_2) ~ cbind(CSU_1, SPD_1, Link_1)
##D set.seed(1234)
##D res <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                sample=1000, thinning=2, burnin=100,verbose=100)
##D res
##D summary(res)
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



