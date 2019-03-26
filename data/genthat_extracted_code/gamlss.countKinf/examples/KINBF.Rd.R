library(gamlss.countKinf)


### Name: KINBF
### Title: K-inflated Negative Binomial Family distributions for fitting a
###   GAMLSS model
### Aliases: KINBF dKINBF pKINBF qKINBF rKINBF
### Keywords: distribution regression

### ** Examples

#--------------------------------------------------------------------------------

# gives information about the default links for the  Negative Binomial Family distribution
KINBF()
#--------------------------------------------------------------------------------

# generate zero inflated Negative Binomial Family distribution
gen.Kinf(family=NBF, kinf=0)

# generate random sample from zero inflated Negative Binomial Family distribution
x<-rinf0NBF(1000,mu=1, sigma=.5, nu=-.2, tau=.2)

# fit the zero inflated Negative Binomial Family distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf0NBF, data=data)
##D histDist(x, family=inf0NBF)
## End(Not run)
#--------------------------------------------------------------------------------

# generated one inflated Negative Binomial Family distribution
gen.Kinf(family=NBF, kinf=1)

# generate random sample from one inflated Negative Binomial Family distribution
x<-rinf1NBF(1000,mu=1, sigma=.5, nu=-.2, tau=.2)

# fit the one inflated Negative Binomial Family distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf1NBF, data=data)
##D histDist(x, family=inf1NBF)
## End(Not run)
#--------------------------------------------------------------------------------

mu=4; sigma=.5; nu=.2; tau=.2;
par(mgp=c(2,1,0),mar=c(4,4,4,1)+0.1)

#plot the pdf using plot
plot(function(x) dinf1NBF(x, mu=mu, sigma=sigma, nu=nu, tau=tau), from=0, to=20,
n=20+1, type="h",xlab="x",ylab="f(x)",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the cdf using plot
cdf <- stepfun(0:19, c(0,pinf1NBF(0:19, mu=mu, sigma=sigma, nu=nu, tau=tau)), f = 0)
plot(cdf, xlab="x", ylab="F(x)", verticals=FALSE, cex.points=.8, pch=16, main="",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the qdf using plot
invcdf <- stepfun(seq(0.01,.99,length=19), qinf1NBF(seq(0.1,.99,length=20),mu,        sigma), f = 0)
plot(invcdf, ylab=expression(x[p]==F^{-1}(p)), do.points=FALSE,verticals=TRUE,
     cex.points=.8, pch=16, main="",cex.lab=1.5, xlab="p")
#--------------------------------------------------------------------------------

# generate random sample
Ni <- rinf1NBF(1000, mu=mu, sigma=sigma, nu=nu, tau=tau)
 hist(Ni,breaks=seq(min(Ni)-0.5,max(Ni)+0.5,by=1),col="lightgray", main="",cex.lab=2)
barplot(table(Ni))
#--------------------------------------------------------------------------------



