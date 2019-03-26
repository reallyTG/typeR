library(speedglm)


### Name: summary.speedglm
### Title: Methods to summarize Generalized Linear Models fits
### Aliases: summary.speedglm coef.speedglm vcov.speedglm logLik.speedglm
###   AIC.speedglm
### Keywords: models

### ** Examples

n<-1000
k<-5
y <- rgamma(n,1.5,1)
x <-round( matrix(rnorm(n*k),n,k),digits=3)
colnames(x) <-paste("s",1:k,sep = "")
da<- data.frame(y,x)
fo <- as.formula(paste("y~",paste(paste("s",1:k,sep=""),collapse="+")))

m4 <- speedglm(fo,data=da,family=Gamma(log))
summary(m4)



