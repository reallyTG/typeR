library(fda.usc)


### Name: summary.fregre.fd
### Title: Summarizes information from fregre.fd objects.
### Aliases: summary.fregre.fd print.fregre.fd
### Keywords: print

### ** Examples


# Ex 1. Simulated data
n= 200;tt= seq(0,1,len=101)
x0<-rproc2fdata(n,tt,sigma="wiener")
x1<-rproc2fdata(n,tt,sigma=0.1)
x<-x0*3+x1
beta = tt*sin(2*pi*tt)^2
fbeta = fdata(beta,tt)
y<-inprod.fdata(x,fbeta)+rnorm(n,sd=0.1)

# Functional regression
res=fregre.pc(x,y,l=c(1:5))
summary(res,3,ask=TRUE)

# res2=fregre.pls(x,y,l=c(1:4))
# summary(res2)

# res3=fregre.pls(x,y)
# summary(res3)




