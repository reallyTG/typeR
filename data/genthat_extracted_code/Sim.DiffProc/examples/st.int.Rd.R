library(Sim.DiffProc)


### Name: st.int
### Title: Stochastic Integrals
### Aliases: st.int st.int.default summary.st.int print.st.int time.st.int
###   mean.st.int Median.st.int Mode.st.int quantile.st.int kurtosis.st.int
###   skewness.st.int moment.st.int cv.st.int max.st.int min.st.int
###   bconfint.st.int plot.st.int points.st.int lines.st.int
### Keywords: sde ts

### ** Examples


## Example 1: Ito integral
## f(t,w(t)) = int(exp(w(t) - 0.5*t) * dw(s)) with t in [0,1]
set.seed(1234)

f <- expression( exp(w-0.5*t) )
mod1 <- st.int(expr=f,type="ito",M=50,lower=0,upper=1)
mod1
summary(mod1)
## Display
plot(mod1)
lines(time(mod1),apply(mod1$X,1,mean),col=2,lwd=2)
lines(time(mod1),apply(mod1$X,1,bconfint,level=0.95)[1,],col=4,lwd=2)
lines(time(mod1),apply(mod1$X,1,bconfint,level=0.95)[2,],col=4,lwd=2)
legend("topleft",c("mean path",paste("bound of", 95," percent confidence")),
       inset = .01,col=c(2,4),lwd=2,cex=0.8)

## Example 2: Stratonovich integral
## f(t,w(t)) = int(w(s)  o dw(s)) with t in [0,1]
set.seed(1234)

g <- expression( w )
mod2 <- st.int(expr=g,type="str",M=50,lower=0,upper=1)
mod2
summary(mod2)
## Display
plot(mod2)
lines(time(mod2),apply(mod2$X,1,mean),col=2,lwd=2)
lines(time(mod2),apply(mod2$X,1,bconfint,level=0.95)[1,],col=4,lwd=2)
lines(time(mod2),apply(mod2$X,1,bconfint,level=0.95)[2,],col=4,lwd=2)
legend("topleft",c("mean path",paste("bound of", 95," percent confidence")),
       inset = .01,col=c(2,4),lwd=2,cex=0.8)




