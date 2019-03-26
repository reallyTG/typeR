library(gamlss.countKinf)


### Name: KIYULE
### Title: K-inflated Yule distributions for fitting a GAMLSS model
### Aliases: KIYULE dKIYULE pKIYULE qKIYULE rKIYULE
### Keywords: distribution regression

### ** Examples

#--------------------------------------------------------------------------------

# gives information about the default links for the  Yule distribution  type II
KIYULE()
#--------------------------------------------------------------------------------

# generate zero inflated Yule distribution
gen.Kinf(family=YULE, kinf=0)

# generate random sample from zero inflated Yule distribution
x<-rinf0YULE(1000,mu=1, sigma=.2)

# fit the zero inflated Yule distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf0YULE, data=data)
##D histDist(x, family=inf0YULE)
## End(Not run)
#--------------------------------------------------------------------------------

# generated one inflated Yule distribution
gen.Kinf(family=YULE, kinf=1)

# generate random sample from one inflated Yule distribution
x<-rinf1YULE(1000,mu=1, sigma=.2)

# fit the one inflated Yule distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf1YULE, data=data)
##D histDist(x, family=inf1YULE)
## End(Not run)
#--------------------------------------------------------------------------------

mu=1; sigma=.2;
par(mgp=c(2,1,0),mar=c(4,4,4,1)+0.1)

#plot the pdf using plot
plot(function(x) dinf1YULE(x, mu=mu, sigma=sigma), from=0, to=20, n=20+1,
     type="h",xlab="x",ylab="f(x)",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the cdf using plot
cdf <- stepfun(0:19, c(0,pinf1YULE(0:19, mu=mu, sigma=sigma)), f = 0)
plot(cdf, xlab="x", ylab="F(x)", verticals=FALSE, cex.points=.8, pch=16, main="",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the qdf using plot
invcdf <- stepfun(seq(0.01,.99,length=19), qinf1YULE(seq(0.1,.99,length=20),mu,       sigma), f = 0)
plot(invcdf, ylab=expression(x[p]==F^{-1}(p)), do.points=FALSE,verticals=TRUE,
     cex.points=.8, pch=16, main="",cex.lab=1.5, xlab="p")
#--------------------------------------------------------------------------------

# generate random sample
Ni <- rinf1YULE(1000, mu=mu, sigma=sigma)
 hist(Ni,breaks=seq(min(Ni)-0.5,max(Ni)+0.5,by=1),col="lightgray", main="",cex.lab=2)
barplot(table(Ni))
#--------------------------------------------------------------------------------



