library(eiwild)


### Name: plot.eiwild
### Title: Plot diagnostics for an eiwild Object
### Aliases: plot.eiwild

### ** Examples

## Not run: 
##D # loading some fake election data
##D data(topleveldat)
##D form <- cbind(CSU_2, SPD_2, LINK_2, GRUN_2) ~ cbind(CSU_1, SPD_1, Link_1)
##D set.seed(1234)
##D res <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                 sample=1000, thinning=2, burnin=100,verbose=100)
##D 
##D plot(res, whichPlot=1)
##D plot(res, whichPlot=2)
##D plot(res, whichPlot=3)
##D plot(res, whichPlot=4)
##D 
##D plot(res, whichPlot=1, whichCell=c(1,4,5))
##D plot(res, whichPlot=2, whichCell=c(1,4,5))
##D plot(res, whichPlot=3, whichCell=c(1,4,5))
##D plot(res, whichPlot=4, whichCell=c(1,4,5))
##D 
##D plot(res, whichPlot=1, whichCell=c(1))
##D plot(res, whichPlot=2, whichCell=c(1))
##D plot(res, whichPlot=3, whichCell=c(1))
##D plot(res, whichPlot=4, whichCell=c(1))
##D 
##D plot(res, whichPlot=1, whichParam="alphaDraws")
##D plot(res, whichPlot=2, whichParam="alphaDraws")
##D plot(res, whichPlot=3, whichParam="alphaDraws")
##D plot(res, whichPlot=4, whichParam="alphaDraws")
##D 
##D par(mfrow=c(2,2))
##D plot(res, whichPlot=1, whichCell=1, layout=FALSE)
##D plot(res, whichPlot=2, whichCell=1, layout=FALSE)
##D plot(res, whichPlot=3, whichCell=1, layout=FALSE)
##D plot(res, whichPlot=4, whichCell=1, layout=FALSE)
## End(Not run)



