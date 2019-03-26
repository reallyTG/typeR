library(eiwild)


### Name: tuneVars
### Title: Generate Variance parameters for proposal density
### Aliases: tuneVars

### ** Examples

## Not run: 
##D data(topleveldat)
##D out1 <- tuneVars(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),sample=10000, verbose=11000)
##D out2 <- tuneVars(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"), sample=10000, verbose=11000,
##D                  maxiter=NULL, improv=c(0.01,5))
##D out3 <- tuneVars(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"), sample=10000, verbose=11000,
##D                  maxiter=NULL, accRat=c(0.45,0.55), improv=c(0.01,5))
##D str(out3)
##D out4 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                  betaVars=out1$betaVars, alphaVars=out1$alphaVars,
##D                  sample=10000,thinning=1,burnin=100, verbose=1000)
##D out4
## End(Not run)



