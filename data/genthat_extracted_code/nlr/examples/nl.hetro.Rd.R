library(nlr)


### Name: nl.hetro
### Title: Classic Multi Stage Estimate (CME).
### Aliases: nl.hetro
### Keywords: hetroscedastic error

### ** Examples

chkft<- nl.hetro(formula=nlrobj1[[14]], data=list(xr=Weights$Date,yr=Weights$Weight),
start=list(p1=2200,p2=38,p3=.11), tau=list(sg=.09,landa=2),varmodel=nlrobjvarmdls1[[1]])
chkft$parameters



