library(fda.usc)


### Name: cond.F
### Title: Conditional Distribution Function
### Aliases: cond.F
### Keywords: distribution

### ** Examples


# Read data
n= 500
t= seq(0,1,len=101)
beta = t*sin(2*pi*t)^2
x = matrix(NA, ncol=101, nrow=n)
y=numeric(n)
x0<-rproc2fdata(n,seq(0,1,len=101),sigma="wiener")
x1<-rproc2fdata(n,seq(0,1,len=101),sigma=0.1)
x<-x0*3+x1
fbeta = fdata(beta,t)
y<-inprod.fdata(x,fbeta)+rnorm(n,sd=0.1)

prx=x[1:100];pry=y[1:100]
ind=101;ind2=102:110
pr0=x[ind];pr10=x[ind2,]
ndist=61
gridy=seq(-1.598069,1.598069, len=ndist)
# Conditional Function
res1 = cond.F(pr10, gridy, prx, pry,p=1)
# res2 = cond.F(pr10, gridy, prx, pry,h=0.3)
# res3 = cond.F(pr10, gridy, prx, pry,g=0.25,h=0.3)

# plot(res1$Fc[,1],type="l",ylim=c(0,1))
# lines(res2$Fc[,1],type="l",col=2)
# lines(res3$Fc[,1],type="l",col=3)







