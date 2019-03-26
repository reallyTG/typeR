library(lcmm)


### Name: plot.predict
### Title: Plot of predicted trajectories and link functions
### Aliases: plot.predict plot.predictL plot.predictY plot.predictY.hlme
###   plot.predictY.lcmm plot.predictY.Jointlcmm plot.predictY.multlcmm
###   plot.predictL.lcmm plot.predictL.Jointlcmm plot.predictL.multlcmm
###   plot.predictL plot.predictlink.lcmm plot.predictlink.Jointlcmm
###   plot.predictlink.multlcmm plot.predictlink plot.predict
###   plot.predictYcond

### ** Examples



################# Prediction from linear latent class model
## fitted model
m<-lcmm(Y~Time*X1,mixture=~Time,random=~Time,classmb=~X2+X3,
subject='ID',ng=2,data=data_hlme,B=c(0.41,0.55,-0.18,-0.41,
-14.26,-0.34,1.33,13.51,24.65,2.98,1.18,26.26,0.97))
## newdata for predictions plot
newdata<-data.frame(Time=seq(0,5,length=100),
X1=rep(0,100),X2=rep(0,100),X3=rep(0,100))
plot(predictL(m,newdata,var.time="Time"),legend.loc="right",bty="l")
## data from the first subject for predictions plot
firstdata<-data_hlme[1:3,]
plot(predictL(m,firstdata,var.time="Time"),legend.loc="right",bty="l")

 ## Not run: 
##D ################# Prediction from a joint latent class model
##D ## fitted model - see help of Jointlcmm function for details on the model
##D m3 <- Jointlcmm(fixed= Ydep1~Time*X1,mixture=~Time,random=~Time,
##D classmb=~X3,subject='ID',survival = Surv(Tevent,Event)~X1+mixture(X2),
##D hazard="3-quant-splines",hazardtype="PH",ng=3,data=data_lcmm,
##D B=c(0.7576, 0.4095, -0.8232, -0.2737, 0, 0, 0, 0.2838, -0.6338, 
##D 2.6324, 5.3963, -0.0273, 1.398, 0.8168, -15.041, 10.164, 10.2394, 
##D 11.5109, -2.6219, -0.4553, -0.6055, 1.473, -0.0383, 0.8512, 0.0389, 
##D 0.2624, 1.4982))
##D # class-specific predicted trajectories 
##D #(with characteristics of subject ID=193)
##D data <- data_lcmm[data_lcmm$ID==193,]
##D plot(predictY(m3,newdata=data,var.time="Time"),bty="l")
## End(Not run)




