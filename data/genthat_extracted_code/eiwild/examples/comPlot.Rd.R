library(eiwild)


### Name: comPlot
### Title: Plot Diagnostics to compare eiwild objects
### Aliases: comPlot

### ** Examples

## Not run: 
##D # loading some fake election data
##D data(topleveldat)
##D form <- cbind(CSU_2, SPD_2, LINK_2, GRUN_2) ~ cbind(CSU_1, SPD_1, Link_1)
##D set.seed(1234)
##D out1 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                 sample=1000, thinning=2, burnin=100, verbose=100)
##D out2 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                 sample=1000, thinning=2, burnin=100, verbose=100)
##D out3 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                 sample=1000, thinning=2, burnin=100, verbose=100)
##D out4 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                 sample=1000, thinning=2, burnin=100, verbose=100)
##D 
##D eiList <- list(out1, out2, out3, out4)
##D 
##D comPlot(eiList, whichCell=1, whichPlot=1)
##D comPlot(eiList, whichCell="counts.CSU_1.CSU_2", whichPlot=1)
##D comPlot(eiList, whichCell=1, whichPlot=1, smooth=TRUE)
##D 
##D comPlot(eiList, whichCell=1, whichPlot=2)
##D 
##D comPlot(eiList, whichCell=1, whichPlot=3)
##D 
##D comPlot(eiList, whichCell=1, whichPlot=4)
##D comPlot(eiList, whichCell=1, whichPlot=4)
##D comPlot(eiList, 1, 3, whichParam="alphaDraws")
##D 
##D comPlot(eiList, "alpha.CSU_1.CSU_2", 3, whichParam="alphaDraws")
## End(Not run)



