library(lcmm)


### Name: plot.Diffepoce
### Title: Plots
### Aliases: plot.Diffepoce plot.pred.accuracy plot.epoce

### ** Examples


## Not run: 
##D # estimation of the joint latent class model
##D m3 <- Jointlcmm(fixed= Ydep1~Time*X1,mixture=~Time,random=~Time,
##D classmb=~X3,subject='ID',survival = Surv(Tevent,Event)~X1+mixture(X2),
##D hazard="3-quant-splines",hazardtype="PH",ng=3,data=data_lcmm,
##D B=c(0.7667, 0.4020, -0.8243, -0.2726, 0.0000, 0.0000, 0.0000, 0.3020,
##D -0.6212, 2.6247, 5.3139, -0.0255, 1.3595, 0.8172, -11.6867, 10.1668,
##D 10.2355, 11.5137, -2.6209, -0.4328, -0.6062, 1.4718, -0.0378, 0.8505,
##D 0.0366, 0.2634, 1.4981))
##D # predictive accuracy of the model evaluated with EPOCE
##D VecTime <- c(1,3,5,7,9,11,13,15)
##D cvpl <- epoce(m3,var.time="Time",pred.times=VecTime)
##D summary(cvpl)
##D plot(cvpl,bty="l",ylim=c(0,2))
## End(Not run)




