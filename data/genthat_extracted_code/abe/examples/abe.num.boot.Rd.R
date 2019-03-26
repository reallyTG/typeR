library(abe)


### Name: abe.num.boot
### Title: ABE for model which include only numeric covariates, bootstrap
###   version
### Aliases: abe.num.boot
### Keywords: internal

### ** Examples

## Don't show: 
set.seed(1)
n=100
x1<-runif(n)
x2<-runif(n)
x3<-runif(n)
y<--5+5*x1+5*x2+ rnorm(n,sd=5)
dd<-data.frame(y,x1,x2,x3)
fit<-lm(y~x1+x2+x3,x=TRUE,y=TRUE,data=dd)

abe.fit<-abe.num.boot(fit,data=dd,include="x1",active="x2",
tau=0.05,exp.beta=FALSE,exact=TRUE,criterion="alpha",alpha=0.2,
type.test="Chisq",k=2)

summary(abe.fit)
## End(Don't show)



