library(abe)


### Name: plot.abe
### Title: Plot Function
### Aliases: plot.abe

### ** Examples

set.seed(1)
n=100
x1<-runif(n)
x2<-runif(n)
x3<-runif(n)
y<--5+5*x1+5*x2+ rnorm(n,sd=5)
dd<-data.frame(y=y,x1=x1,x2=x2,x3=x3)
fit<-lm(y~x1+x2+x3,x=TRUE,y=TRUE,data=dd)

fit.boot<-abe.boot(fit,data=dd,include="x1",active="x2",
tau=c(0.05,0.1),exp.beta=FALSE,exact=TRUE,
criterion="alpha",alpha=c(0.2,0.05),type.test="Chisq",
num.boot=50,type.boot="bootstrap")

plot(fit.boot,type.plot="coefficients",
alpha=0.2,tau=0.1,variable=c("x1","x3"),
col="light blue")

plot(fit.boot,type.plot="variables",
alpha=0.2,tau=0.1,variable=c("x1","x2","x3"),
col="light blue",horiz=TRUE,las=1)

par(mar=c(4,6,4,2))
plot(fit.boot,type.plot="models",
alpha=0.2,tau=0.1,col="light blue",horiz=TRUE,las=1)



