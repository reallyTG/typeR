library(hcc)


### Name: ustemp
### Title: U.S. winter temperatures for various latitudes and longitudes
### Aliases: ustemp
### Keywords: datasets

### ** Examples

data(ustemp)
lmod<-lm(y~x1+x2, data=ustemp)
x1<-ustemp[,"x1"]
x2<-ustemp[,"x2"]
res<-resid(lmod)
hctest(x1, res)



