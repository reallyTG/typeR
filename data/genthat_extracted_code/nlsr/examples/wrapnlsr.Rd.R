library(nlsr)


### Name: wrapnlsr
### Title: Provides class nls solution to a nonlinear least squares
###   solution using the Nash Marquardt tools.
### Aliases: wrapnlsr
### Keywords: nonlinear least squares

### ** Examples

cat("See more examples in nlmrt-package.Rd\n")
cat("kvanderpoel.R test of wrapnlsr\n")
# require(nlsr)
x<-c(1,3,5,7)
y<-c(37.98,11.68,3.65,3.93)
pks28<-data.frame(x=x,y=y)
fit0<-try(nls(y~(a+b*exp(1)^(-c*x)), data=pks28, start=c(a=0,b=1,c=1), 
          trace=TRUE))
print(fit0)
cat("\n\n")
fit1<-nlxb(y~(a+b*exp(-c*x)), data=pks28, start=c(a=0,b=1,c=1), trace = TRUE)
print(fit1) 
cat("\n\nor better\n")
fit2<-wrapnlsr(y~(a+b*exp(-c*x)), data=pks28, start=c(a=0,b=1,c=1), 
              lower=-Inf, upper=Inf, trace = TRUE)




