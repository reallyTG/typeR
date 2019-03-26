library(lcmm)


### Name: Diffepoce
### Title: Difference of expected prognostic cross-entropy (EPOCE)
###   estimators and its 95% tracking interval between two joint latent
###   class models estimated with 'Jointlcmm'
### Aliases: Diffepoce

### ** Examples


## Not run: 
##D #### estimation with 2 latent classes (ng=2)
##D m2 <- Jointlcmm(fixed= Ydep1~Time*X1,random=~Time,mixture=~Time,subject='ID'
##D ,survival = Surv(Tevent,Event)~ X1+X2 ,hazard="Weibull"
##D ,hazardtype="PH",ng=2,data=data_lcmm,
##D B=c( 0.7608, -9.4974,  1.0242,  1.4331,  0.1063 , 0.6714, 10.4679, 11.3178,
##D  -2.5671, -0.5386,  1.4616, -0.0605,  0.9489,  0.1020,  0.2079,  1.5045),logscale=TRUE)
##D m1 <- Jointlcmm(fixed= Ydep1~Time*X1,random=~Time,subject='ID'
##D ,survival = Surv(Tevent,Event)~ X1+X2 ,hazard="Weibull"
##D ,hazardtype="PH",ng=1,data=data_lcmm,
##D B=c(-7.6634,  0.9136,  0.1002,  0.6641, 10.5675, -1.6589,  1.4767, -0.0806,
##D   0.9240,0.5643,  1.2277,  1.5004))
##D 
##D ## EPOCE computation for predictions times from 1 to 6 on the dataset used
##D ## for estimation of m.
##D VecTime <- c(1,3,5,7,9,11,13,15)
##D cvpol1 <- epoce(m1,var.time="Time",pred.times=VecTime)
##D cvpol1
##D cvpol2 <- epoce(m2,var.time="Time",pred.times=VecTime)
##D cvpol2
##D DeltaEPOCE <- Diffepoce(cvpol1,cvpol2)
##D summary(DeltaEPOCE)
##D plot(DeltaEPOCE,bty="l")
## End(Not run)




