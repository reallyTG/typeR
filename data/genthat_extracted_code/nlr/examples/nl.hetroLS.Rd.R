library(nlr)


### Name: nl.hetroLS
### Title: CLSME estimate.
### Aliases: nl.hetroLS
### Keywords: hetroscedastic error

### ** Examples

chkft<- nl.hetroLS(formula=nlrobj1[[14]], data=list(xr=Weights$Date,yr=Weights$Weight),
start=list(p1=2200,p2=38,p3=.11), tau=list(sg=.09,landa=2),varmodel=nlrobjvarmdls1[[1]])
chkft$parameters



