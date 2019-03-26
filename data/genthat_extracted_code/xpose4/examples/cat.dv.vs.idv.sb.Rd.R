library(xpose4)


### Name: cat.dv.vs.idv.sb
### Title: Categorical observations vs. independent variable using stacked
###   bars.
### Aliases: cat.dv.vs.idv.sb
### Keywords: methods

### ** Examples


## Not run: 
##D ## read in table files
##D runno <- 45
##D xpdb <- xpose.data(runno)
##D 
##D ## make some stacked bar plots
##D cat.dv.vs.idv.sb(xpdb,idv=NULL,stack=F)
##D cat.dv.vs.idv.sb(xpdb,idv=NULL,stack=F,by="DOSE")
##D cat.dv.vs.idv.sb(xpdb,idv="DOSE")
##D cat.dv.vs.idv.sb(xpdb,idv=NULL,stack=F,by="TIME")
##D cat.dv.vs.idv.sb(xpdb,idv="TIME")
##D cat.dv.vs.idv.sb(xpdb,idv="CAVH")
##D cat.dv.vs.idv.sb(xpdb,idv="TIME",by="DOSE",scales=list(x=list(rot=45)))
##D 
##D ## make some mirror plots
##D cat.dv.vs.idv.sb(xpdb,idv="DOSE",mirror=1)
##D cat.dv.vs.idv.sb(xpdb,idv="CAVH",mirror=1,auto.key=F)
## End(Not run)




