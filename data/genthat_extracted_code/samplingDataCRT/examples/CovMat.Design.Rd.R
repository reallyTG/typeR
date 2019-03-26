library(samplingDataCRT)


### Name: CovMat.Design
### Title: covariance matrix for the multivariate normal distributed
###   variables
### Aliases: CovMat.Design

### ** Examples

K<-6  #measurement (or timepoints)
I<-10 #Cluster
J<-2 #number of subjects

sigma.1<-0.1
sigma.3<-0.9
CovMat.Design(K, J, I,sigma.1.q=sigma.1, sigma.3.q=sigma.3)

sigma.1<-0.1
sigma.2<-0.4
sigma.3<-0.9
CovMat.Design(K, J, I,sigma.1.q=sigma.1, sigma.2.q=sigma.2, sigma.3.q=sigma.3)



