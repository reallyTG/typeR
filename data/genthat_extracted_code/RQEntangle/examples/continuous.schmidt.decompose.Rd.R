library(RQEntangle)


### Name: continuous.schmidt.decompose
### Title: Perform a continuous Schmidt decomposition
### Aliases: continuous.schmidt.decompose

### ** Examples

coupled.harm.fcn<- function(x1,x2) exp(-((0.5*(x1+x2))**2))*exp(-(x1-x2)**2)*sqrt(2./pi)
continuous.schmidt.decompose(coupled.harm.fcn, -10, 10, -10, 10)




