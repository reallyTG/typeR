library(nlmrt)


### Name: wrapnls
### Title: Nash variant of Marquardt nonlinear least squares solution via
###   qr linear solver.
### Aliases: wrapnls
### Keywords: nonlinear least squares

### ** Examples

cat("See examples in nlmrt-package.Rd\n")

## Not run: 
##D cat("kvanderpoel.R test\n")
##D # require(nlmrt)
##D x<-c(1,3,5,7)
##D y<-c(37.98,11.68,3.65,3.93)
##D pks28<-data.frame(x=x,y=y)
##D fit0<-try(nls(y~(a+b*exp(1)^(-c*x)), data=pks28, start=c(a=0,b=1,c=1), 
##D           trace=TRUE))
##D print(fit0)
##D cat("\n\n")
##D fit1<-nlxb(y~(a+b*exp(-c*x)), data=pks28, start=c(a=0,b=1,c=1), trace = TRUE)
##D print(fit1) 
##D cat("\n\nor better\n")
##D fit2<-wrapnls(y~(a+b*exp(-c*x)), data=pks28, start=c(a=0,b=1,c=1), 
##D               lower=-Inf, upper=Inf, trace = TRUE)
##D 
## End(Not run)



