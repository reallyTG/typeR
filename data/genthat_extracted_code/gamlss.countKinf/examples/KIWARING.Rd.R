library(gamlss.countKinf)


### Name: KIWARING
### Title: K-inflated Waring distributions for fitting a GAMLSS model
### Aliases: KIWARING dKIWARING pKIWARING qKIWARING rKIWARING
### Keywords: distribution regression

### ** Examples

#--------------------------------------------------------------------------------

# gives information about the default links for the  Waring distribution
KIWARING()
#--------------------------------------------------------------------------------

# generate zero inflated Waring distribution
gen.Kinf(family=WARING, kinf=0)

# generate random sample from zero inflated Waring distribution
x<-rinf0WARING(1000,mu=1, sigma=.5, nu=.2)

# fit the zero inflated Waring distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf0WARING, data=data)
##D histDist(x, family=inf0WARING)
## End(Not run)
#--------------------------------------------------------------------------------

# generated one inflated Waring distribution
gen.Kinf(family=WARING, kinf=1)

# generate random sample from one inflated Waring distribution
x<-rinf1WARING(1000,mu=1, sigma=.5, nu=.2)

# fit the one inflated Waring distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf1WARING, data=data)
##D histDist(x, family=inf1WARING)
## End(Not run)
#--------------------------------------------------------------------------------

mu=4; sigma=.5; nu=.2;
par(mgp=c(2,1,0),mar=c(4,4,4,1)+0.1)

#plot the pdf using plot
plot(function(x) dinf1WARING(x, mu=mu, sigma=sigma, nu=nu), from=0, to=20,
n=20+1, type="h",xlab="x",ylab="f(x)",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the cdf using plot
cdf <- stepfun(0:19, c(0,pinf1WARING(0:19, mu=mu, sigma=sigma, nu=nu)), f = 0)
plot(cdf, xlab="x", ylab="F(x)", verticals=FALSE, cex.points=.8, pch=16, main="",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the qdf using plot
invcdf <- stepfun(seq(0.01,.99,length=19), qinf1WARING(seq(0.1,.99,length=20),mu, sigma), f = 0)
plot(invcdf, ylab=expression(x[p]==F^{-1}(p)), do.points=FALSE,verticals=TRUE,
     cex.points=.8, pch=16, main="",cex.lab=1.5, xlab="p")
#--------------------------------------------------------------------------------

# generate random sample
Ni <- rinf1WARING(1000, mu=mu, sigma=sigma, nu=nu)
 hist(Ni,breaks=seq(min(Ni)-0.5,max(Ni)+0.5,by=1),col="lightgray", main="",cex.lab=2)
barplot(table(Ni))
#--------------------------------------------------------------------------------



