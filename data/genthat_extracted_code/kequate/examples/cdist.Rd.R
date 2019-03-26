library(kequate)


### Name: cdist
### Title: Conditional Mean, Variance, Skewness and Kurtosis
### Aliases: cdist

### ** Examples

freqdata<-data.frame(X=c(1,2,2,1,2,2,2,2,3,1,2,1,4,2,1,1,3,3,3,3), 
A=(c(0,2,1,1,0,3,1,2,2,0,2,0,3,1,1,2,2,2,1,2)))
Pdata<-kefreq(freqdata$X, 0:5, freqdata$A, 0:3)
Pglm<-glm(frequency~X+I(X^2)+A+I(A^2)+X:A, data=Pdata, family="poisson", x=TRUE)
Pobs<-matrix(Pdata$freq, nrow=6)/sum(Pglm$y)
Pest<-matrix(Pglm$fitted.values, nrow=6)/sum(Pglm$y)
cdP<-cdist(Pest, Pobs, 0:5, 0:3)
plot(cdP)



