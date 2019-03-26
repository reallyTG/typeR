library(obliqueRSF)


### Name: predict.orsf
### Title: Compute predictions using an oblique random survival forest.
### Aliases: predict.orsf

### ** Examples

data("pbc",package='survival')
pbc$status[pbc$status>=1]=pbc$status[pbc$status>=1]-1
pbc$id=NULL
fctrs<-c('trt','ascites','spiders','edema','hepato','stage')
for(f in fctrs)pbc[[f]]=as.factor(pbc[[f]])
pbc=na.omit(pbc)

orsf=ORSF(data=pbc,ntree=5)
times=seq(365, 365*4,length.out = 10)

predict(orsf,newdata=pbc[c(1:5),],times=times)



