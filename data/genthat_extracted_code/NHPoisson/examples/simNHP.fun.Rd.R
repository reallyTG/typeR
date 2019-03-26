library(NHPoisson)


### Name: simNHP.fun
### Title: Generation of the occurrence points of a NHPP
### Aliases: simNHP.fun buscar

### ** Examples

#Generation of the occurrence times of a homogeneours PP with  constant intensity 
#0.01 in a period  of time of length 1000

aux<-simNHP.fun(lambda=rep(0.01,1000))
aux$posNH

#if we want reproducible results, we can fixed the seed in the generation process
aux<-simNHP.fun(lambda=rep(0.01,1000),fixed.seed=123)
aux$posNH

#and the result is:
#  [1]  85 143 275 279 284 316 347 362 634 637 738 786 814 852 870 955


#Generation of  the occurrence times of a NHPP with  time-varying intensity t in 
#a period  of time of length 500

t<-runif(500, 0.01,0.1)
aux<-simNHP.fun(lambda=t)
aux$posNH



