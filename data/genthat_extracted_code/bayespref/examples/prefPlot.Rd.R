library(bayespref)


### Name: prefPlot
### Title: Plot population and individual preferences
### Aliases: prefPlot

### ** Examples

## Not run: 
##D data(YGGV)
##D res <- bayesPref(pData=YGGV,mcmcL=1000)
##D 
##D prefPlot(prefres=res[[1]],burn=100,pop=TRUE) 
##D 
##D prefPlot(prefres=res[[1]],burn=100,pop=TRUE,ymax=15,leg=TRUE,
##D catname=c("Astragalus"," Lotus","Lupine","Medicago"),lx=0.6,ly=14) #includes legend
##D 
##D prefPlot(prefres=res[[1]],burn=100,ind=FALSE,pop=TRUE,ymax=15,leg=TRUE,
##D catname=c("Astragalus"," Lotus","Lupine","Medicago"),lx=0.6,ly=14) #includes only 
##D population posterior and legend
## End(Not run)


