library(gamlss.countKinf)


### Name: KIBNB
### Title: K-inflated Beta Negative Binomial distributions for fitting a
###   GAMLSS model
### Aliases: KIBNB dKIBNB pKIBNB qKIBNB rKIBNB
### Keywords: distribution regression

### ** Examples

#-------------------------------------------------------------------------------

KIBNB() # gives information about the default links for the  Beta Negative Binomial distribution
#-------------------------------------------------------------------------------

# generate zero inflated Beta Negative Binomial distribution
gen.Kinf(family=BNB, kinf=0)

# generate random sample from zero inflated Beta Negative Binomial distribution
x<-rinf0BNB(1000,mu=1, sigma=.5, nu=.2, tau=.2)

# fit the zero inflated Beta Negative Binomial distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf0BNB, data=data)
##D histDist(x, family=inf0BNB)
## End(Not run)
#-------------------------------------------------------------------------------

# generated one inflated Beta Negative Binomial distribution
gen.Kinf(family=BNB, kinf=1)

# generate random sample from one inflated Beta Negative Binomial distribution
x<-rinf1BNB(1000,mu=1, sigma=.5, nu=.2, tau=.2)

# fit the one inflated Beta Negative Binomial distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf1BNB, data=data)
##D histDist(x, family=inf1BNB)
## End(Not run)
#-------------------------------------------------------------------------------

mu=4; sigma=.5; nu=.2; tau=.2;
par(mgp=c(2,1,0),mar=c(4,4,4,1)+0.1)

#plot the pdf using plot
plot(function(x) dinf1BNB(x, mu=mu, sigma=sigma, nu=nu, tau=tau), from=0, to=20,
n=20+1, type="h",xlab="x",ylab="f(x)",cex.lab=1.5)
#-------------------------------------------------------------------------------

#plot the cdf using plot
cdf <- stepfun(0:19, c(0,pinf1BNB(0:19, mu=mu, sigma=sigma, nu=nu, tau=tau)), f = 0)
plot(cdf, xlab="x", ylab="F(x)", verticals=FALSE, cex.points=.8, pch=16, main="",cex.lab=1.5)
#-------------------------------------------------------------------------------

#plot the qdf using plot
invcdf <- stepfun(seq(0.01,.99,length=19), qinf1BNB(seq(0.1,.99,length=20),mu, sigma), f = 0)
plot(invcdf, ylab=expression(x[p]==F^{-1}(p)), do.points=FALSE,verticals=TRUE,
     cex.points=.8, pch=16, main="",cex.lab=1.5, xlab="p")
#-------------------------------------------------------------------------------

# generate random sample
Ni <- rinf1BNB(1000, mu=mu, sigma=sigma, nu=nu, tau=tau)
 hist(Ni,breaks=seq(min(Ni)-0.5,max(Ni)+0.5,by=1),col="lightgray", main="",cex.lab=2)
barplot(table(Ni))
#-------------------------------------------------------------------------------



