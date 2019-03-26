library(abe)


### Name: abe.fact2
### Title: ABE for model which includes categorical covariates, individual
###   option
### Aliases: abe.fact2
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

abe.fit<-abe.fact2(fit,data=dd,include="x1",active="x2",
tau=0.05,exp.beta=FALSE,exact=TRUE,criterion="alpha",alpha=0.2,
type.test="Chisq",verbose=FALSE)
summary(abe.fit)
## End(Don't show)



