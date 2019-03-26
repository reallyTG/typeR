library(mixsmsn)


### Name: smsn.mix
### Title: Fit univariate FM-SMSN distribution
### Aliases: smsn.mix
### Keywords: interface models

### ** Examples

mu1 <- 5; mu2 <- 20; mu3 <- 35
sigma2.1 <- 9; sigma2.2 <- 16; sigma2.3 <- 9
lambda1 <- 5; lambda2 <- -3; lambda3 <- -6
nu = 5

mu <- c(mu1,mu2,mu3)
sigma2 <- c(sigma2.1,sigma2.2,sigma2.3)
shape <- c(lambda1,lambda2,lambda3)
pii <- c(0.5,0.2,0.3)

arg1 = c(mu1, sigma2.1, lambda1, nu)
arg2 = c(mu2, sigma2.2, lambda2, nu)
arg3 = c(mu3, sigma2.3, lambda3, nu)
y <- rmix(n=1000, p=pii, family="Skew.t", arg=list(arg1,arg2,arg3))

## Not run: 
##D par(mfrow=c(1,2))
##D ## Normal fit
##D Norm.analysis <- smsn.mix(y, nu = 3, g = 3, get.init = TRUE, criteria = TRUE, 
##D                           group = TRUE, family = "Normal", calc.im=FALSE)
##D mix.hist(y,Norm.analysis)
##D mix.print(Norm.analysis)
##D mix.dens(y,Norm.analysis)
##D 
##D ## Skew Normal fit
##D Snorm.analysis <- smsn.mix(y, nu = 3, g = 3, get.init = TRUE, criteria = TRUE, 
##D                            group = TRUE, family = "Skew.normal", calc.im=FALSE)
##D mix.hist(y,Snorm.analysis)
##D mix.print(Snorm.analysis)
##D mix.dens(y,Snorm.analysis)
##D 
##D ## t fit
##D t.analysis <- smsn.mix(y, nu = 3, g = 3, get.init = TRUE, criteria = TRUE, 
##D                         group = TRUE, family = "t", calc.im=FALSE)
##D mix.hist(y,t.analysis)
##D mix.print(t.analysis)
##D mix.dens(y,t.analysis)
##D 
##D ## Skew t fit
##D St.analysis <- smsn.mix(y, nu = 3, g = 3, get.init = TRUE, criteria = TRUE, 
##D                         group = TRUE, family = "Skew.t", calc.im=FALSE)
##D mix.hist(y,St.analysis)
##D mix.print(St.analysis)
##D mix.dens(y,St.analysis)
##D 
##D ## Skew Contaminated Normal fit
##D Scn.analysis <- smsn.mix(y, nu = c(0.3,0.3), g = 3, get.init = TRUE, criteria = TRUE, 
##D                          group = TRUE, family = "Skew.cn", calc.im=FALSE)
##D mix.hist(y,Scn.analysis)
##D mix.print(Scn.analysis)
##D mix.dens(y,Scn.analysis)
##D 
##D par(mfrow=c(1,1))
##D mix.dens(y,Norm.analysis)
##D mix.lines(y,Snorm.analysis,col="green")
##D mix.lines(y,t.analysis,col="red")
##D mix.lines(y,St.analysis,col="blue")
##D mix.lines(y,Scn.analysis,col="grey")
## End(Not run)



