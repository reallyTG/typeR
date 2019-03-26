library(lcmm)


### Name: epoce
### Title: Estimators of the Expected Prognostic Observed Cross-Entropy
###   (EPOCE) for evaluating predictive accuracy of joint latent class
###   models estimated using 'Jointlcmm'
### Aliases: epoce

### ** Examples


## Not run: 
##D ## estimation of a joint latent class model with 2 latent classes (ng=2)
##D # (see the example section of Jointlcmm for details about
##D #  the model specification)
##D 
##D m <- Jointlcmm(fixed= Ydep1~Time*X1,random=~Time,mixture=~Time,subject='ID'
##D ,survival = Surv(Tevent,Event)~ X1+X2 ,hazard="Weibull"
##D ,hazardtype="PH",ng=2,data=data_lcmm,logscale=TRUE,
##D B=c(0.7608, -9.4974 , 1.0242,  1.4331 , 0.1063 , 0.6714, 10.4679, 11.3178,
##D  -2.5671, -0.5386,  1.4616, -0.0605,  0.9489,  0.1020 , 0.2079,  1.5045))
##D summary(m)
##D 
##D ## Computation of the EPOCE on the same dataset as used for
##D # estimation of m with times at predictions from 1 to 15 
##D VecTime <- c(1,3,5,7,9,11,13,15)
##D cvpl <- epoce(m,var.time="Time",pred.times=VecTime)
##D summary(cvpl)
##D plot(cvpl,bty="l",ylim=c(0,2))
## End(Not run)





