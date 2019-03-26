library(FIACH)


### Name: spmOrth
### Title: Serial Orthogonalisation
### Aliases: spmOrth

### ** Examples

a<-basisFunctions(1/16,orth=FALSE)
ts.plot(a,ylim=c(-.007,.015))
ts.plot(spmOrth(a),ylim=c(-.007,.015))



