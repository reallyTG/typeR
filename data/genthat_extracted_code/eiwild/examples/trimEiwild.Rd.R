library(eiwild)


### Name: trimEiwild
### Title: Trims eiwild-object
### Aliases: trimEiwild

### ** Examples

## Not run: 
##D # loading some fake election data
##D data(topleveldat)
##D form <- cbind(CSU_2, SPD_2, LINK_2, GRUN_2) ~ cbind(CSU_1, SPD_1, Link_1)
##D set.seed(1234)
##D res <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                 sample=1000, thinning=2, burnin=100,verbose=100)
##D 
##D res
##D res2<- trimEiwild(res, burnin=100, thinning=3)
##D res2
## End(Not run)



