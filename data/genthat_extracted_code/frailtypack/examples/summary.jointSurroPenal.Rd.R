library(frailtypack)


### Name: summary.jointSurroPenal
### Title: Short summary of the random effects parameters, the fixed
###   treatment effects, and the surrogacy evaluation criteria estimated
###   from a joint surrogate model
### Aliases: summary.jointSurroPenal print.summary.jointSurroPenal
### Keywords: methods

### ** Examples




###---Data generation---###
data.sim <-jointSurrSimul(n.obs=400, n.trial = 20,cens.adm=549, 
          alpha = 1.5, theta = 3.5, gamma = 2.5, zeta = 1, 
          sigma.s = 0.7, sigma.t = 0.7,rsqrt = 0.8, betas = -1.25, 
          betat = -1.25, full.data = 0, random.generator = 1, 
          seed = 0, nb.reject.data = 0)
## Not run: 
##D ###---Estimation---###
##D joint.surrogate <- jointSurroPenal(data = data.sim, nb.mc = 300, 
##D                    nb.gh = 20, indice.alpha = 1, n.knots = 6)
##D                             
##D summary(joint.surrogate)
##D summary(joint.surrogate, d = 4, len = 3, int.method.kt = 1, nb.gh = 25)
## End(Not run)





