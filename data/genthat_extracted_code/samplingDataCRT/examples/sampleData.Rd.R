library(samplingDataCRT)


### Name: sampleData
### Title: Sampling Response of individuals within a SWD model
### Aliases: sampleData

### ** Examples

K<-6  #measurement (or timepoints)
I<-10 #Cluster
J<-2 #number of subjects
X<-designMatrix(nC=I, nT=K, nSw=2)
D<-completeDataDesignMatrix(J, X)
sigma.1<-0.1
sigma.3<-0.9
type<-"cross-sec"
V<-CovMat.Design(K, J, I, sigma.1=sigma.1, sigma.3=sigma.3)
mu.0<-0
theta<-1
betas<-rep(0, K-1)
parameters<-c(mu.0, betas, theta)
sample.data<-sampleData(type = type, K=K,J=J,I=I, D=D, V=V, parameters=parameters)
xtabs(~cluster+measurement, data=sample.data)



