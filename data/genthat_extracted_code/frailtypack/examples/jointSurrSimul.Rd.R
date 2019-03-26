library(frailtypack)


### Name: jointSurrSimul
### Title: Generate survival times for two endpoints using the joint
###   frailty surrogate model
### Aliases: jointSurrSimul

### ** Examples


data.sim <- jointSurrSimul(n.obs=600, n.trial = 30,cens.adm=549.24, alpha = 1.5, 
            theta = 3.5, gamma = 2.5, zeta = 1, sigma.s = 0.7, sigma.t = 0.7,
            rsqrt = 0.8, betas = -1.25, betat = -1.25, full.data = 0, 
            random.generator = 1, seed = 0, nb.reject.data = 0)




