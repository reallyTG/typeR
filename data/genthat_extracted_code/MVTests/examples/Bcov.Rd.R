library(MVTests)


### Name: Bcov
### Title: Bartlett's Test for One Sample Covariance Matrix
### Aliases: Bcov

### ** Examples


data(iris) 
S<-matrix(c(5.71,-0.8,-0.6,-0.5,-0.8,4.09,-0.74,-0.54,-0.6,
     -0.74,7.38,-0.18,-0.5,-0.54,-0.18,8.33),ncol=4,nrow=4)
result <- Bcov(data=iris[,1:4],Sigma=S)
summary(result)



