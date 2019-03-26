library(obliqueRSF)


### Name: ORSF
### Title: Grow an oblique random survival forest (ORSF)
### Aliases: ORSF

### ** Examples

data("pbc",package='survival')
pbc$status[pbc$status>=1]=pbc$status[pbc$status>=1]-1
pbc$id=NULL
fctrs<-c('trt','ascites','spiders','edema','hepato','stage')
for(f in fctrs)pbc[[f]]=as.factor(pbc[[f]])
pbc=na.omit(pbc)

orsf=ORSF(data=pbc,ntree=5)




