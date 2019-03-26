library(gamlss.countKinf)


### Name: KIGEOMo
### Title: K-inflated Geometric original distributions for fitting a GAMLSS
###   model
### Aliases: KIGEOMo dKIGEOMo pKIGEOMo qKIGEOMo rKIGEOMo
### Keywords: distribution regression

### ** Examples

#--------------------------------------------------------------------------------

# gives information about the default links for the  Geometric original distribution
KIGEOMo()
#--------------------------------------------------------------------------------

# generate zero inflated Geometric original distribution
gen.Kinf(family=GEOMo, kinf=0)

# generate random sample from zero inflated Geometric original distribution
x<-rinf0GEOMo(1000,mu=.5, sigma=.2)

# fit the zero inflated Geometric original distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf0GEOMo, data=data)
##D histDist(x, family=inf0GEOMo)
## End(Not run)
#--------------------------------------------------------------------------------

# generated one inflated Geometric original distribution
gen.Kinf(family=GEOMo, kinf=1)

# generate random sample from one inflated Geometric original distribution
x<-rinf1GEOMo(1000,mu=.5, sigma=.2)

# fit the one inflated Geometric original distribution using gamlss
data<-data.frame(x=x)
## Not run: 
##D gamlss(x~1, family=inf1GEOMo, data=data)
##D histDist(x, family=inf1GEOMo)
## End(Not run)
#--------------------------------------------------------------------------------

mu=.3; sigma=.2;
par(mgp=c(2,1,0),mar=c(4,4,4,1)+0.1)
#plot the pdf using plot
plot(function(x) dinf1GEOMo(x, mu=mu, sigma=sigma), from=0, to=20, n=20+1,
     type="h",xlab="x",ylab="f(x)",cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the cdf using plot
cdf <- stepfun(0:19, c(0,pinf1GEOMo(0:19, mu=mu, sigma=sigma)), f = 0)
plot(cdf, xlab="x", ylab="F(x)", verticals=FALSE, cex.points=.8, pch=16, main=""      ,cex.lab=1.5)
#--------------------------------------------------------------------------------

#plot the qdf using plot
invcdf <- stepfun(seq(0.01,.99,length=19), qinf1GEOMo(seq(0.1,.99,length=20),mu, sigma), f = 0)
plot(invcdf, ylab=expression(x[p]==F^{-1}(p)), do.points=FALSE,verticals=TRUE,
     cex.points=.8, pch=16, main="",cex.lab=1.5, xlab="p")
#--------------------------------------------------------------------------------

# generate random sample
Ni <- rinf1GEOMo(1000, mu=mu, sigma=sigma)
 hist(Ni,breaks=seq(min(Ni)-0.5,max(Ni)+0.5,by=1),col="lightgray", main="",cex.lab=2)
barplot(table(Ni))
#--------------------------------------------------------------------------------



