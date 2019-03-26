library(geozoning)


### Name: datanormX
### Title: normalize data coords with same ratio (for non square field)
### Aliases: datanormX

### ** Examples

x=runif(100, min=0, max=1)
y=runif(100, min=0.2, max=1.7)
range(x) # not [0,1]
tabData=data.frame(x=x,y=y)
bd=list(x=c(0,0,1,1,0), y=c(0.2,1.7,1.7,0.2,0.2))
res=datanormX(tabData,bd)
apply(res$dataN,2,range)# x range is now [0,1], not y range
res$ratio # normalization ratio



