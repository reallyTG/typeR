library(jackknifeKME)


### Name: jackknifeKME
### Title: Jackknife estimates of Kaplan-Meier estimators or integrals
### Aliases: jackknifeKME
### Keywords: jackknife bias

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package). 
#For mean lifetime estimator.
data<-data(n=100, p=4, r=0, b1=c(2,2,3,3), sig=1, Cper=0)
kme1<-jackknifeKME(data$x,data$y, data$delta, method="condMean",estimator = 1)
## No test: 
kme1
## End(No test)

#Estimates are for mean lifetime estimators.Data contain only status and survival time.  
data2<-simdata(n = 100,lambda = 2.04) 
data2$delta[length(data2$delta)]<-0 
kme2<-jackknifeKME(, data2$Y, data2$delta, method="PDQ",estimator = 1)
## No test: 
kme2
## End(No test)

#Estimates are for Kaplan-Meier 2nd order F-moment.
data3<-simdata(n = 100,lambda = 2.04) 
data3$delta[length(data3$delta)]<-0 
kme3<-jackknifeKME(, data3$Y, data3$delta, method="PDQ",estimator = 2)
## No test: 
kme3
## End(No test)



