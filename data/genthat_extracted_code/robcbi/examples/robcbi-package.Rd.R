library(robcbi)


### Name: robcbi-package
### Title: Robust Fit for Discrete Generalized Linear Model
### Aliases: robcbi-package robcbi
### Keywords: package robust

### ** Examples

 library(robcbi)
# First example
 data(Finney)
 Vol <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
## Not run: 
##D  plot(Vol,Rate,type="n")
##D  points(Vol[Resp==0],Rate[Resp==0],pch=5, cex=1.2)
##D  points(Vol[Resp==1],Rate[Resp==1],pch=16,cex=1.2)
## End(Not run)
 lVol <-log(Vol); lRate <- log(Rate)
 z.glm <- glm(Resp~lVol+lRate,family=binomial)
 summary(z.glm)
 z.cub <- glm(Resp~lVol+lRate,family=binomial,method="cubinf", ufact=3.2)
 summary(z.cub)
 weights(z.cub)
## Not run: 
##D  plot(z.cub, smooth=TRUE, ask=TRUE)
## End(Not run)
 comp <- fits.compare(z.glm,z.cub)
 comp
## Not run: 
##D  plot(comp)
## End(Not run)
# Second example
 data(Breslow)
## Not run: 
##D  
##D  help(Breslow)
## End(Not run)
 y  = Breslow$sumY
 x1 = Breslow$Age10
 x2 = Breslow$Base4
 x3 = rep(0,length(y))
 x3[Breslow$Trt=="progabide"] = 1
 x4 = x2*x3
 CBA = glm(y~x1+x2+x3+x4,family=poisson,method=cubinf,ufact=3.2)
## Not run: 
##D  plot(CBA,num=5)
## End(Not run)
 weights(CBA)
#
# compute the $R_n^2$ statistic (Section 2.5) to compare CBA 
# with a reduced model with three variables:
#
 CBA.red = update(CBA, .~.-x3-x4)
 np = 5       # number of parameters of the full model
 nq = 3       # number of parameters of the reduced model
 CVR = covar(CBA)
 CFF = coef(CBA)
 K22 = CVR[(nq+1):np,(nq+1):np]
 cff = as.matrix(CFF[(nq+1):np])
 Rn2 = t(cff)%*%solve(K22)%*%cff
 Rn2



