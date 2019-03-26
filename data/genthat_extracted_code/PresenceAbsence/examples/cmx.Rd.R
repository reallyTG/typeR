library(PresenceAbsence)


### Name: cmx
### Title: Confusion Matrix
### Aliases: cmx
### Keywords: models

### ** Examples


### EXAMPLE 1 ###
     ### generate simulated data ###
     set.seed(666)
     N=1000
     SIMDATA<-matrix(0,N,3)
     SIMDATA<-as.data.frame(SIMDATA)
     names(SIMDATA)<-c("plotID","Observed","Predicted")
     SIMDATA$plotID<-1:N
     SIMDATA$Observed<-rbinom(n=N,size=1,prob=.2)
     SIMDATA$Predicted[SIMDATA$Observed==1]<-rnorm(n=length(SIMDATA$Observed[SIMDATA$Observed==1]),mean=.8,sd=.15)
     SIMDATA$Predicted[SIMDATA$Observed==0]<-rnorm(n=length(SIMDATA$Observed[SIMDATA$Observed==0]),mean=.2,sd=.15)
     SIMDATA$Predicted<-(SIMDATA$Predicted-min(SIMDATA$Predicted))/(max(SIMDATA$Predicted)-min(SIMDATA$Predicted))

     ### plot simulated data
     hist(SIMDATA$Predicted,100)

     ### calculate confusion matrix ###
     cmx(SIMDATA)

### EXAMPLE 2 ###

     data(SIM3DATA)

     cmx(SIM3DATA)
     cmx(SIM3DATA,which.model=2)
     cmx(SIM3DATA,which.model=3,threshold=.2)




