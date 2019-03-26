library(delt)


### Name: intpcf
### Title: Calculates the integral of a piecewise constant function
### Aliases: intpcf
### Keywords: math

### ** Examples

library(denpro)
dendat<-sim.data(n=50,seed=5,type="mulmodII")
eva<-eval.greedy(dendat,leaf=5)
intpcf(eva)
 



