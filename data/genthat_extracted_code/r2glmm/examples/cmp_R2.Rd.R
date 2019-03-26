library(r2glmm)


### Name: cmp_R2
### Title: Compute R2 with a specified C matrix
### Aliases: cmp_R2

### ** Examples

library(nlme)
library(lme4)
library(mgcv)
lmemod = lme(distance ~ age*Sex, random = ~1|Subject, data = Orthodont)
X = model.matrix(lmemod, data = Orthodont)
SigHat = extract.lme.cov(lmemod, data = Orthodont)
beta = fixef(lmemod)
p = length(beta)
obsperclust = as.numeric(table(lmemod$data[,'Subject']))
nclusts = length(obsperclust)
C = cbind(rep(0, p-1),diag(p-1))
partial.c = make.partial.C(p-1,p,2)

cmp_R2(c=C, x=X, SigHat=SigHat, beta=beta, obsperclust = obsperclust,
nclusts = nclusts, method = 'sgv')
cmp_R2(c=partial.c, x=X, SigHat=SigHat, beta=beta, obsperclust = obsperclust,
nclusts = nclusts, method = 'sgv')



