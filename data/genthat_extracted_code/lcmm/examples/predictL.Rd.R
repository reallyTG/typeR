library(lcmm)


### Name: predictL
### Title: Class-specific marginal predictions in the latent process scale
###   for 'lcmm', 'Jointlcmm' and 'multlcmm' objects
### Aliases: predictL predictL.lcmm predictL.multlcmm predictL.Jointlcmm

### ** Examples


#### Prediction from a 2-class model with a Splines link function
## Not run: 
##D ## fitted model
##D m<-lcmm(Ydep2~Time*X1,mixture=~Time,random=~Time,classmb=~X2+X3,
##D subject='ID',ng=2,data=data_lcmm,link="splines",B=c(
##D -0.175,      -0.191,       0.654,      -0.443, 
##D -0.345,      -1.780,       0.913,       0.016, 
##D  0.389,       0.028,       0.083,      -7.349, 
##D  0.722,       0.770,       1.376,       1.653, 
##D  1.640,       1.285))
##D summary(m)
##D ## predictions for times from 0 to 5 for X1=0
##D newdata<-data.frame(Time=seq(0,5,length=100),
##D X1=rep(0,100),X2=rep(0,100),X3=rep(0,100))
##D predictL(m,newdata,var.time="Time")
##D ## predictions for times from 0 to 5 for X1=1
##D newdata$X1 <- 1
##D predictY(m,newdata,var.time="Time")
## End(Not run)




