library(gamlss.countKinf)


### Name: KIGEOM
### Title: K-inflated Geometric distributions for fitting a GAMLSS model
### Aliases: KIGEOM dKIGEOM pKIGEOM qKIGEOM rKIGEOM
### Keywords: distribution regression

### ** Examples

#--------------------------------------------------------------------------------

# gives information about the default links for the  Geometric distribution
KIGEOM()
#--------------------------------------------------------------------------------

# generate zero inflated Geometric distribution
gen.Kinf(family=GEOM, kinf=0)

# generate random sample from zero inflated Geometric distribution
x<-rinf0GEOM(1000,mu=1, sigma=.2)

# fit the zero inflated Geometric distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf0GEOM, data=data)
##D histDist(x, family=inf0GEOM)
## End(Not run)
#--------------------------------------------------------------------------------

# generated one inflated Geometric distribution
gen.Kinf(family=GEOM, kinf=1)

# generate random sample from one inflated Geometric distribution
x<-rinf1GEOM(1000,mu=1, sigma=.2)

# fit the one inflated Geometric distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf1GEOM, data=data)
##D histDist(x, family=inf1GEOM)
## End(Not run)
#--------------------------------------------------------------------------------

mu=1; sigma=.2;
par(mgp=c(2,1,0),mar=c(4,4,4,1)+0.1)

#plot the pdf using plot
plot(function(x) dinf1GEOM(x, mu=mu, sigma=sigma), from=0, to=20, n=20+1,
     type="h",xlab="x",ylab="f(x)",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the cdf using plot
cdf <- stepfun(0:19, c(0,pinf1GEOM(0:19, mu=mu, sigma=sigma)), f = 0)
plot(cdf, xlab="x", ylab="F(x)", verticals=FALSE,cex.points=.8, pch=16, main="",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the qdf using plot
invcdf <- stepfun(seq(0.01,.99,length=19),qinf1GEOM(seq(0.1,.99,length=20),mu,        sigma), f = 0)
plot(invcdf, ylab=expression(x[p]==F^{-1}(p)), do.points=FALSE,verticals=TRUE,
     cex.points=.8, pch=16, main="",cex.lab=1.5, xlab="p")
#--------------------------------------------------------------------------------

# generate random sample
Ni <- rinf1GEOM(1000, mu=mu, sigma=sigma)
 hist(Ni,breaks=seq(min(Ni)-0.5,max(Ni)+0.5,by=1),col="lightgray", main="",cex.lab=2)
barplot(table(Ni))
#--------------------------------------------------------------------------------



