library(frailtypack)


### Name: jointSurroTKendall
### Title: Kendall's tau estimation using numerical integration methods
### Aliases: jointSurroTKendall

### ** Examples

Ktau1 <- jointSurroTKendall(theta = 3.5, gamma = 2.5, nb.gh = 32)
Ktau2 <- jointSurroTKendall(theta = 1, gamma = 0.8, alpha = 1, zeta = 1, nb.gh = 32)

###---Kendall's \eqn{\tau} from a joint surrogate model ---###

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
##D  Ktau3 <- jointSurroTKendall(joint.surrogate)
##D  Ktau4 <- jointSurroTKendall(joint.surrogate,nb.MC.kendall = 4000,seed = 1)
## End(Not run)




