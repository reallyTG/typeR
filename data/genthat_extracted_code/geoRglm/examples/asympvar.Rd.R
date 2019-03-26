library(geoRglm)


### Name: asympvar
### Title: Asymptotic Variance
### Aliases: asympvar
### Keywords: spatial

### ** Examples

## Don't show: 
library(geoR)
## End(Don't show)
data(p50)
## Not run: 
##D test <- pois.krige(p50, krige = krige.glm.control(cov.pars = c(1,1), beta = 1),
##D       mcmc.input = mcmc.control(S.scale = 0.5, n.iter = 1000, thin = 1))
##D asympvar(test$intensity[45,])
##D ass <- asympvar(test$intensity[1:10,], type = "pos")
## End(Not run)
## Don't show: 
test <- pois.krige(p50, krige = krige.glm.control(cov.pars = c(1,1), beta = 1),
      mcmc.input = mcmc.control(S.scale = 0.5, n.iter = 100, thin = 1))
asympvar(test$intensity[45,])
ass <- asympvar(test$intensity[1:10,], type = "pos")
## End(Don't show)



