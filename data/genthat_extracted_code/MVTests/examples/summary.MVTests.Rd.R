library(MVTests)


### Name: summary.MVTests
### Title: Summarizing Results in MVTests Package
### Aliases: summary.MVTests

### ** Examples


# One Sample Hotelling T Square Test
data(iris)
X<-iris[1:50,1:4]
mean0<-c(6,3,1,0.25)
result.onesample <- OneSampleHT2(data=X,mu0=mean0,alpha=0.05)
summary(result.onesample)

#Two Independent Sample Hotelling T Square Test
data(iris)
G<-c(rep(1,50),rep(2,50))
result.twosamples <- TwoSamplesHT2(data=iris[1:100,1:4],group=G,alpha=0.05)
summary(result.twosamples)

 #One Way MANOVA
data(iris)
results.Wilks <- Manova(data=iris[,1:4],group=iris[,5],alpha=0.05)
summary(results.Wilks)

#Box's M Test
data(iris)
result.BoxM <- BoxM(data=iris[,1:4],group=iris[,5])
summary(result.BoxM)

#Barlett's Test of Sphericity
data(iris)
result.Bsper <- Bsper(data=iris[,1:4])
summary(result.Bsper)

#Multivariate Shapio-Wilk Test
data(iris)
result.mvShapiro <- mvShapiro(data=iris[,1:4])
summary(result.mvShapiro)
result.mvShapiro.group <- mvShapiro(data=iris[,1:4],group=TRUE,G=iris[,5])
summary(result.mvShapiro.group)

#Bartlett's Test for One Sample Covariance Matrix
data(iris) 
S<-matrix(c(5.71,-0.8,-0.6,-0.5,-0.8,4.09,-0.74,-0.54,-0.6,-0.74,
          7.38,-0.18,-0.5,-0.54,-0.18,8.33),ncol=4,nrow=4)
result.bcov<- Bcov(data=iris[,1:4],Sigma=S)
summary(result.bcov)



