library(ConvergenceConcepts)


### Name: visualize.sp
### Title: Visualisation of sample paths
### Aliases: visualize.sp
### Keywords: dplot distribution htest

### ** Examples

myrand <- function(n,...){cumsum(rnorm(n,...))/(1:n)}
data <- generate(randomgen=myrand,nmax=1000,M=500)$data
visualize.sp(data,main="Ten sample paths",col="grey")



