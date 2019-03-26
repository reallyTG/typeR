library(sensitivity)


### Name: parameterSets
### Title: Generate parameter sets
### Aliases: parameterSets
### Keywords: utilities

### ** Examples


X.grid <- parameterSets(par.ranges=list(V1=c(1,1000),V2=c(1,4)),
                          samples=c(10,10),method="grid")
plot(X.grid)

X.innergrid<-parameterSets(par.ranges=list(V1=c(1,1000),V2=c(1,4)),
                          samples=c(10,10),method="innergrid")
points(X.innergrid,col="red")

## No test: 
library(randtoolbox)
X.sobol<-parameterSets(par.ranges=list(V1=c(1,1000),V2=c(1,4)),
                           samples=100,method="sobol")
plot(X.sobol)
## End(No test)



