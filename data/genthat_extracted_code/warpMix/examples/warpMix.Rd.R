library(warpMix)


### Name: warpMix
### Title: Estimate the non linear mixed effect functional model.
### Aliases: warpMix

### ** Examples

T = seq(0.5,0.841,length.out = 9)
n = 10
t = c(qnorm(T),1)
mu = cos(2*pi*t+pi/2)
library(fda)
baseMu = create.bspline.basis(c(0,max(t)), norder = 2, breaks = seq(0,1,0.5))
splineBasisMu = eval.basis(t,baseMu)
alphaMu = Data2fd(mu,argvals = t, baseMu)$coef
muApprox = (splineBasisMu) %*% alphaMu
baseU = create.bspline.basis(c(0,max(t)),norder = 2, breaks = seq(0,1,0.5))
mU = baseU$nbasis
sigmaU = diag(0.1,mU)
library(MASS)
alphaU = t(mvrnorm(n,rep(0,mU),sigmaU))
splineBasisU = eval.basis(t,baseU)
U = splineBasisU %*% alphaU
epsilon = t(mvrnorm(n,rep(0,length(t)),0.01 * diag(1,length(t))))
X = as.vector(muApprox) + U + epsilon
baseW = create.bspline.basis(c(0,max(t)), norder = 2, breaks = c(0,0.6,1))
mW = baseW$nbasis
splineBasisW = eval.basis(t,baseW)
theta = t(mvrnorm(n,rep(0,mW),diag(0.1,mW + 1e-3 * diag(1,mW))))
wtheta = matrix(rep(0,n*length(t)),ncol = n)
for (i in c(1:n)){
 wtheta[,i] = warpTimeFunction(splineBasisW,theta[,i],t)$warpTime
}
Y = matrix(0, nrow = length(t), ncol = n)
for (i in c(1:n)){
 y = approxfun(wtheta[,i],X[,i])
 Y[,i] = y(t)
}
warpMix(t,Y,baseMu, baseU, baseW, nIte = 2)






