library(obliqueRSF)


### Name: predictSurvProb.orsf
### Title: Compute predictions using an oblique random survival forest.
### Aliases: predictSurvProb.orsf

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
##D times=seq(365, 365*4,length.out = 10)
##D 
##D predict(orsf,newdata=pbc[c(1:5),],times=times)
## End(Not run)



