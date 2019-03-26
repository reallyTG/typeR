library(gamlss.mx)


### Name: gamlss.mx-package
### Title: The GAMLSS add on package for mixture distributions
### Aliases: gamlss.mx-package gamlss.mx
### Keywords: package distribution regression

### ** Examples

data(enzyme)
mmNO <- gamlssMX(enzyme$act~1, family=NO, K=2)
mmNO
## Not run: 
##D # also to make sure that it reaches the maximum
##D mmNOs <- gamlssMXfits(n=10,enzyme$act~1, family=NO, K=2)
##D fyNO<-dMX(y=seq(0,3,.01), mu=list(1.253, 0.1876), sigma=list(exp(-0.6665 ), exp(-2.573 )),
##D                   pi=list(0.4079609, 0.5920391 ), family=list("NO","NO") )
##D hist(enzyme$act,freq=FALSE,ylim=c(0,3.5),xlim=c(0,3),br=21)
##D lines(seq(0,3,.01),fyNO, col="red")
##D # equivalent model using gamlssNP
##D mmNP <- gamlssNP(act~1, data=enzyme, random=~1,sigma.fo=~MASS,family=NO, K=2)
## End(Not run)



