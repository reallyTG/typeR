library(lava)


### Name: confpred
### Title: Conformal prediction
### Aliases: confpred

### ** Examples

set.seed(123)
n <- 200
x <- seq(0,6,length.out=n)
delta <- 3
ss <- exp(-1+1.5*cos((x-delta)))
ee <- rnorm(n,sd=ss)
y <- (x-delta)+3*cos(x+4.5-delta)+ee
d <- data.frame(y=y,x=x)

newd <- data.frame(x=seq(0,6,length.out=50))
cc <- confpred(lm(y~splines::ns(x,knots=c(1,3,5)),data=d), data=d, newdata=newd)
if (interactive()) {
plot(y~x,pch=16,col=lava::Col("black"),ylim=c(-10,10),xlab="X",ylab="Y")
with(cc,
     lava::confband(newd$x,lwr,upr,fit,
        lwd=3,polygon=TRUE,col=Col("blue"),border=FALSE))
}



