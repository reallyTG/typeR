library(NHPoisson)


### Name: unifres.fun
### Title: Exponential and Uniform (generalized) residuals of a HPP
### Aliases: unifres.fun

### ** Examples

## generates the occurrence times of a homogeneours PP with  constant intensity 0.01 
## and calculates de residuals

aux<-simNHP.fun(lambda=rep(0.01,1000))

res<-unifres.fun(aux$posNH)



