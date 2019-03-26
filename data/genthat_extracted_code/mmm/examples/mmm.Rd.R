library(mmm)


### Name: mmm
### Title: an R function to fit the multivariate marginal models to analyze
###   multivariate longitudinal data
### Aliases: mmm
### Keywords: generalized estimating equations

### ** Examples

#########################
## Binary data example ##
#########################

data(motherStress)
fit1<-mmm(formula=cbind(stress,illness)~married+education+
employed+chlth+mhlth+race+csex+housize+bstress+billness+
week,id=motherStress$id,data=motherStress,family=binomial,corStruct="exchangeable")
summary(fit1)

########################
## Count data example ##
########################

## First we illustrate how the data set is simulated
## Then the R script to analyze the data set by mmm is given
## Note: no need to run the script to generate the data set, unless of interest

## Not run: 
##D ### Generating the data by the help of 'corcounts' package
##D 
##D # loading the package 'corcounts'
##D library("corcounts")
##D 
##D # setting the seed to 12
##D set.seed(12)
##D 
##D # number of subjects in the study
##D n1 <- 500
##D 
##D # defining the response and covariate families (Poi indicates Poisson distribution)
##D margins <- c("Poi","Poi","Poi","Poi","Poi","Poi","Poi","Poi","Poi")
##D 
##D # the means of the responses and covariate. while 5 and 8 are the means of the responses
##D # 20 is the mean of the time independent covariate
##D mu <- c(5, 8, 20, 5, 8, 5, 8, 5, 8)
##D 
##D # the correlation structure which 'corcounts' uses to generate correlated count data
##D # (unstr indicates unstructured correlation structure)
##D corstr <- "unstr"
##D 
##D # the correlation matrix corcounts assumes the correlated count data have
##D corpar<-matrix(c(1,0.4,0.6,0.9,0.37,0.8,0.34,0.7,0.31,
##D 0.4,1,0.6,0.37,0.9,0.34,0.8,0.31,0.7,
##D 0.6,0.6,1,0.6,0.6,0.6,0.6,0.6,0.6,
##D 0.9,0.37,0.6,1,0.4,0.9,0.37,0.8,0.34,
##D 0.37,0.9,0.6,0.4,1,0.37,0.9,0.34,0.8,
##D 0.8,0.34,0.6,0.9,0.37,1,0.4,0.9,0.37,
##D 0.34,0.8,0.6,0.37,0.9,0.4,1,0.37,0.9,
##D 0.7,0.31,0.6,0.8,0.34,0.9,0.37,1,0.4,
##D 0.31,0.7,0.6,0.34,0.8,0.37,0.9,0.4,1),ncol=9,byrow=T)
##D 
##D # generating the correlated count data by 'rcounts' function avaiable in 'corcounts'
##D data1 <- rcounts(N=n1,margins=margins,mu=mu,corstr=corstr,corpar=corpar)
##D 
##D ### The reconstruction of the generated correlated count data to 
##D ### the longitudinal data (long) format
##D 
##D # seperating the bivariate responses measured at the first time 
##D # point and the time independent covariate 
##D time11<-data1[,1:3]
##D 
##D # seperating the bivariate responses measured at the second time
##D # point and combining them with the time independent covariate
##D time12<-cbind(data1[,4:5],data1[,3])
##D 
##D # seperating the bivariate responses measured at the third time
##D # point and combining them with the time independent covariate
##D time13<-cbind(data1[,6:7],data1[,3])
##D 
##D # seperating the bivariate responses measured at the fourth time
##D # point and combining them with the time independent covariate
##D time14<-cbind(data1[,8:9],data1[,3])
##D 
##D # combining the data for all the time points
##D data12<-rbind(time11,time12,time13,time14)
##D 
##D # constructing the time variable
##D time1<-matrix(rep(seq(1:4),each=n1))
##D 
##D # constructing the id variable 
##D id1<-matrix(rep(seq(1:n1),4))
##D 
##D # combining the id of the subjects, the simulated data and the time variable
##D data13<-cbind(id1,data12,time1)
##D 
##D # reconstructing the data subject by subject which 'mmm' expects it has 
##D data14<-NULL
##D for (i in 1:n1) data14<-rbind(data14,data13[data13[,1]==i,])
##D 
##D ### Data manipulations on the covariates
##D 
##D # taking natural logarithm of the time independent covariate
##D data14[,4]<-log(data14[,4])
##D 
##D # standardizing time variable
##D data14[,5]<-scale(data14[,5])
##D 
##D # adding the interaction of the time independent covariate 
##D # and time as a new covariate
##D multiLongCount<-as.data.frame(cbind(data14,data14[,4]*data14[,5]))
##D names(multiLongCount)<-c("ID","resp1","resp2","X","time","X.time")
## End(Not run)

### R script to analyze the count data set
### It is already stored in mmm pacakge

data(multiLongCount)
fit2<-mmm(formula=cbind(resp1,resp2)~X+time+X.time,
id=multiLongCount$ID,data=multiLongCount,family=poisson,corStruct="unstructured")
summary(fit2)

#############################
## Continuous data example ##
#############################

## First we illustrate how the data set is simulated
## Then the R script to analyze the data set by mmm is given
## Note: no need to run the script to generate the data set, unless of interest

## Not run: 
##D ### Generating the data by the help of mvtnorm package
##D 
##D # loading package 'mvtnorm' 
##D library("mvtnorm")
##D 
##D # number of subjects in the study
##D n2<-500
##D 
##D # setting the seed to 12
##D set.seed(12)
##D 
##D # specifying the correlation matrix which 'mvtnorm' assumes the correlated data have
##D cormat<-matrix(c(1,0.4,0.6,0.9,0.37,0.8,0.34,0.7,0.31,
##D 0.4,1,0.6,0.37,0.9,0.34,0.8,0.31,0.7,
##D 0.6,0.6,1,0.6,0.6,0.6,0.6,0.6,0.6,
##D 0.9,0.37,0.6,1,0.4,0.9,0.37,0.8,0.34,
##D 0.37,0.9,0.6,0.4,1,0.37,0.9,0.34,0.8,
##D 0.8,0.34,0.6,0.9,0.37,1,0.4,0.9,0.37,
##D 0.34,0.8,0.6,0.37,0.9,0.4,1,0.37,0.9,
##D 0.7,0.31,0.6,0.8,0.34,0.9,0.37,1,0.4,
##D 0.31,0.7,0.6,0.34,0.8,0.37,0.9,0.4,1),ncol=9,byrow=T)
##D 
##D # variances of the responses and time independent covariate
##D # while 0.97 and 1.1 correspond to the variances of the bivariate responses
##D # 4 corresponds to the variance of the time independent covariate
##D variance<-c(0.97,1.1,4,0.97,1.1,0.97,1.1,0.97,1.1)
##D 
##D # constructing the (diaonal) standard deviation matrix 
##D std<-diag(sqrt(variance),9)
##D 
##D # constructing the variance covariance matrix, sigma
##D sigma<-std##D 
##D 
##D # generating the correlated continuous data utilizing 'rmvnorm' function available
##D # in 'mvtnorm'; method="svd" indicates use of 'singular value decomposition method
##D data2<-rmvnorm(n2,mean = rep(0,nrow(sigma)),sigma=sigma,method="svd")
##D 
##D 
##D ### The reconstruction of the generated correlated continuous data to the 
##D ### longitudinal data (long) format
##D 
##D # seperating the bivariate responses measured at first time point 
##D # and the time independent covariate
##D time21<-data2[,1:3]
##D 
##D # seperating the bivariate responses measured at second time point
##D # and combining them with the time independent covariate
##D time22<-cbind(data2[,4:5],data2[,3])
##D 
##D # seperating the bivariate responses measured at third time point
##D # and combining them with the time independent covariate
##D time23<-cbind(data2[,6:7],data2[,3])
##D 
##D # seperating the bivariate responses measured at fourth time point
##D # and combining them with the time independent covariate
##D time24<-cbind(data2[,8:9],data2[,3])
##D 
##D # combining the data for all the time points
##D data22<-rbind(time21,time22,time23,time24)
##D 
##D # constructing the time variable
##D time2<-matrix(rep(seq(1:4),each=n2))
##D 
##D # constructing the id variable
##D id2<-matrix(rep(seq(1:n2),4))
##D 
##D # combining the id of the subjects, the generated data and the time variable
##D data23<-cbind(id2,data22,time2)
##D 
##D # reconstructing the data subject by subject which 'mmm' expects it has
##D data24<-NULL
##D for (i in 1:n2) data24<-rbind(data24,data23[data23[,1]==i,])
##D 
##D ### Data manipulations on the covariates
##D 
##D # standardizing the time variable
##D data24[,5]<-scale(data24[,5])
##D 
##D # adding the interaction of the time independent covariate 
##D # and time as a new covariate
##D multiLongGaussian<-as.data.frame(cbind(data24,data24[,4]*data24[,5]))
##D names(multiLongGaussian)<-c("ID","resp1","resp2","X","time","X.time")
## End(Not run)


### R script to analyze the continuous data set
### It is already stored in mmm pacakge

data(multiLongGaussian)
fit3<-mmm(formula=cbind(resp1,resp2)~X+time+X.time,
id=multiLongGaussian$ID,data=multiLongGaussian,family=gaussian,corStruct="unstructured")
summary(fit3)



