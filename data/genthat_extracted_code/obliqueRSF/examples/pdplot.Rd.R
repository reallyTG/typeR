library(obliqueRSF)


### Name: pdplot
### Title: Plot partial variable dependence using an oblique random
###   survival forest
### Aliases: pdplot

### ** Examples

## Not run: 
##D data("pbc",package='survival')
##D pbc$status[pbc$status>=1]=pbc$status[pbc$status>=1]-1
##D pbc$time=pbc$time/365.25
##D pbc$id=NULL
##D fctrs<-c('trt','ascites','spiders','edema','hepato','stage')
##D for(f in fctrs)pbc[[f]]=as.factor(pbc[[f]])
##D pbc=na.omit(pbc)
##D 
##D orsf=ORSF(data=pbc, eval_time=1:10,ntree=30)
##D 
##D pdplot(object=orsf, xvar='bili', xlab='Bilirubin', 
##D        xvar_units='mg/dl', sub_times=10)
## End(Not run)



