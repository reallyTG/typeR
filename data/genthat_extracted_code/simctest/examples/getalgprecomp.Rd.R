library(simctest)


### Name: getalgprecomp
### Title: Construct algorithms
### Aliases: getalgprecomp getalgonthefly
### Keywords: classes

### ** Examples

alg<-getalgprecomp()
run(alg, function() runif(1)<0.01)

alg<-getalgonthefly()
run(alg, function() runif(1)<0.01)



