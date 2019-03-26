library(obliqueRSF)


### Name: print.orsf
### Title: Grow an oblique random survival forest (ORSF)
### Aliases: print.orsf

### ** Examples

## Not run: 
##D data("pbc",package='survival')
##D pbc$status[pbc$status>=1]=pbc$status[pbc$status>=1]-1
##D pbc$id=NULL
##D fctrs<-c('trt','ascites','spiders','edema','hepato','stage')
##D for(f in fctrs)pbc[[f]]=as.factor(pbc[[f]])
##D pbc=na.omit(pbc)
##D 
##D orsf=ORSF(data=pbc,ntree=30)
##D print(orsf)
## End(Not run)



