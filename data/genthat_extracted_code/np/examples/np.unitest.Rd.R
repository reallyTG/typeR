library(np)


### Name: npunitest
### Title: Kernel Consistent Univariate Density Equality Test with Mixed
###   Data Types
### Aliases: npunitest
### Keywords: univar nonparametric

### ** Examples

## Not run: 
##D set.seed(1234)
##D n <- 1000
##D 
##D ## Compute the statistic only for data drawn from same distribution
##D 
##D x <- rnorm(n)
##D y <- rnorm(n)
##D 
##D npunitest(x,y,bootstrap=FALSE)
##D 
##D Sys.sleep(5)
##D 
##D ## Conduct the test for this data
##D 
##D npunitest(x,y,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Conduct the test for data drawn from different distributions having
##D ## the same mean and variance
##D 
##D x <- rchisq(n,df=5)
##D y <- rnorm(n,mean=5,sd=sqrt(10))
##D mean(x)
##D mean(y)
##D sd(x)
##D sd(y)
##D 
##D npunitest(x,y,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Two sample t-test for equality of means
##D t.test(x,y)
##D ## F test for equality of variances and asymptotic
##D ## critical values
##D F <- var(x)/var(y)
##D qf(c(0.025,0.975),df1=n-1,df2=n-1)
##D 
##D ## Plot the nonparametric density estimates on the same axes
##D 
##D fx <- density(x)
##D fy <- density(y)
##D xlim <- c(min(fx$x,fy$x),max(fx$x,fy$x))
##D ylim <- c(min(fx$y,fy$y),max(fx$y,fy$y))
##D plot(fx,xlim=xlim,ylim=ylim,xlab="Data",main="f(x), f(y)")
##D lines(fy$x,fy$y,col="red")
##D 
##D Sys.sleep(5)
##D 
##D ## Test for equality of log(wage) distributions
##D 
##D data(wage1)
##D attach(wage1)
##D lwage.male <- lwage[female=="Male"]
##D lwage.female <- lwage[female=="Female"]
##D 
##D npunitest(lwage.male,lwage.female,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Plot the nonparametric density estimates on the same axes
##D 
##D f.m <- density(lwage.male)
##D f.f <- density(lwage.female)
##D xlim <- c(min(f.m$x,f.f$x),max(f.m$x,f.f$x))
##D ylim <- c(min(f.m$y,f.f$y),max(f.m$y,f.f$y))
##D plot(f.m,xlim=xlim,ylim=ylim,
##D      xlab="log(wage)",
##D      main="Male/Female log(wage) Distributions")
##D lines(f.f$x,f.f$y,col="red",lty=2)
##D rug(lwage.male)
##D legend(-1,1.2,c("Male","Female"),lty=c(1,2),col=c("black","red"))
##D 
##D detach(wage1)
##D 
##D Sys.sleep(5)
##D 
##D ## Conduct the test for data drawn from different discrete probability
##D ## distributions
##D 
##D x <- factor(rbinom(n,2,.5))
##D y <- factor(rbinom(n,2,.1))
##D 
##D npunitest(x,y,boot.num=99)
## End(Not run) 



