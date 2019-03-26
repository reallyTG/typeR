library(gamlss.countKinf)


### Name: KIPIG
### Title: K-inflated Poisson Inverse Gaussian distributions for fitting a
###   GAMLSS model
### Aliases: KIPIG dKIPIG pKIPIG qKIPIG rKIPIG
### Keywords: distribution regression

### ** Examples

#--------------------------------------------------------------------------------

# gives information about the default links for the  Poisson Inverse Gaussian distribution
KIPIG()
#--------------------------------------------------------------------------------

# generate zero inflated Poisson Inverse Gaussian distribution
gen.Kinf(family=PIG, kinf=0)

# generate random sample from zero inflated Poisson Inverse Gaussian distribution
x<-rinf0PIG(1000,mu=1, sigma=.5, nu=.2)

# fit the zero inflated Poisson Inverse Gaussian distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf0PIG, data=data)
##D histDist(x, family=inf0PIG)
## End(Not run)
#--------------------------------------------------------------------------------

# generated one inflated Poisson Inverse Gaussian distribution
gen.Kinf(family=PIG, kinf=1)

# generate random sample from one inflated Poisson Inverse Gaussian distribution
x<-rinf1PIG(1000,mu=1, sigma=.5, nu=.2)

# fit the one inflated Poisson Inverse Gaussian distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf1PIG, data=data)
##D histDist(x, family=inf1PIG)
## End(Not run)
#--------------------------------------------------------------------------------

mu=4; sigma=.5; nu=.2;
par(mgp=c(2,1,0),mar=c(4,4,4,1)+0.1)

#plot the pdf using plot
plot(function(x) dinf1PIG(x, mu=mu, sigma=sigma, nu=nu), from=0, to=20, n=20+1,
     type="h",xlab="x",ylab="f(x)",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the cdf using plot
cdf <- stepfun(0:19, c(0,pinf1PIG(0:19, mu=mu, sigma=sigma, nu=nu)), f = 0)
plot(cdf, xlab="x", ylab="F(x)", verticals=FALSE, cex.points=.8, pch=16, main="",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the qdf using plot
invcdf <- stepfun(seq(0.01,.99,length=19), qinf1PIG(seq(0.1,.99,length=20),mu,        sigma), f = 0)
plot(invcdf, ylab=expression(x[p]==F^{-1}(p)), do.points=FALSE,verticals=TRUE,
     cex.points=.8, pch=16, main="",cex.lab=1.5, xlab="p")
#--------------------------------------------------------------------------------

# generate random sample
Ni <- rinf1PIG(1000, mu=mu, sigma=sigma, nu=nu)
 hist(Ni,breaks=seq(min(Ni)-0.5,max(Ni)+0.5,by=1),col="lightgray", main="",cex.lab=2)
barplot(table(Ni))
#--------------------------------------------------------------------------------



