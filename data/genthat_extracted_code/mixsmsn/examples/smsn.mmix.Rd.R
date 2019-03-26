library(mixsmsn)


### Name: smsn.mmix
### Title: Fit multivariate FM-SMSN distributions.
### Aliases: smsn.mmix
### Keywords: interface models

### ** Examples

mu1 <- c(0,0)
Sigma1 <- matrix(c(3,1,1,3), 2,2)
shape1 <-c(4,4)
nu1 <- 4

mu2 <- c(5,5)
Sigma2 <- matrix(c(2,1,1,2), 2,2)
shape2 <-c(2,2)
nu2 <- 4

pii<-c(0.6,0.4)

arg1 = list(mu=mu1, Sigma=Sigma1, shape=shape1, nu=nu1)
arg2 = list(mu=mu2, Sigma=Sigma2, shape=shape2, nu=nu2)
y <- rmmix(n= 500, p = pii, "Skew.t", list(arg1,arg2))

## Not run: 
##D 
##D ## Normal fit giving intial values
##D mu <- list(mu1,mu2)
##D Sigma <- list(Sigma1,Sigma2)
##D shape <- list(shape1,shape2)
##D pii <- c(0.6,0.4)
##D 
##D Norm.analysis <- smsn.mmix(y, nu=3, mu=mu, Sigma=Sigma, shape=shape, pii = pii,
##D                            criteria = TRUE, g=2, get.init = FALSE, group = TRUE,
##D                            family = "Normal")
##D mix.contour(y,Norm.analysis)
##D 
##D ## Normal fit 
##D Norm.analysis <- smsn.mmix(y, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                            group = TRUE, family = "Normal")
##D mix.contour(y,Norm.analysis)
##D 
##D ## Normal fit with a unique Gamma
##D Norm.analysis <- smsn.mmix(y, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                            group = TRUE, family = "Normal", uni.Gama = TRUE)
##D mix.contour(y,Norm.analysis)
##D 
##D 
##D ## Skew Normal fit
##D Snorm.analysis <- smsn.mmix(y, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                             group = TRUE, family = "Skew.normal")
##D mix.contour(y,Snorm.analysis)
##D 
##D ## t fit
##D t.analysis <- smsn.mmix(y, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                          group = TRUE, family = "t")
##D mix.contour(y,t.analysis)
##D 
##D ## Skew t fit
##D St.analysis <- smsn.mmix(y, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                          group = TRUE, family = "Skew.t")
##D mix.contour(y,St.analysis)
##D 
##D ## Skew Contaminated Normal fit
##D Scn.analysis <- smsn.mmix(y, nu=c(0.1,0.1), g=2, get.init = TRUE, criteria = TRUE, 
##D                           group = TRUE, family = "Skew.cn",error=0.01)
##D mix.contour(y,Scn.analysis)
##D 
##D ## Skew Contaminated Normal fit
##D Sslash.analysis <- smsn.mmix(y, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                              group = TRUE, family = "Skew.slash", error=0.1)
##D mix.contour(y,Sslash.analysis)
##D 
## End(Not run)



