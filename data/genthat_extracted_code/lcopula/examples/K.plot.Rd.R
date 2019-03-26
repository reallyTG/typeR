library(lcopula)


### Name: K.plot
### Title: Kendall plot
### Aliases: K.plot

### ** Examples

#Independence
K.plot(matrix(runif(2000),ncol=2))
#Negative dependence
K.plot(rCopula(n=1000,claytonCopula(param=-0.5,dim=2)),add=TRUE,col=2)
#Perfect negative dependence
K.plot(rCopula(n=1000,claytonCopula(param=-1,dim=2)),add=TRUE,col=6)
#Positive dependence
K.plot(rCopula(n=1000,claytonCopula(param=iTau(claytonCopula(0.3),0.5),dim=2)),add=TRUE,col=3)
#Perfect positive dependence
K.plot(rCopula(n=1000,claytonCopula(param=iTau(claytonCopula(0.3),1),dim=2)),add=TRUE,col=4)



