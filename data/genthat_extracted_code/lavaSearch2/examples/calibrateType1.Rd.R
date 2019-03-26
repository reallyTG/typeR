library(lavaSearch2)


### Name: calibrateType1
### Title: Simulation Study Assessing Bias and Type 1 Error
### Aliases: calibrateType1 calibrateType1.lvm calibrateType1.lvmfit

### ** Examples

## Not run: 
##D #### simulate data ####
##D m.Sim <- lvm(c(Y1[mu1:sigma]~1*eta,
##D                Y2[mu2:sigma]~1*eta,
##D                Y3[mu3:sigma]~1*eta,
##D                eta~beta1*Group+beta2*Gender))
##D latent(m.Sim) <- ~eta
##D categorical(m.Sim, labels = c("M","F")) <- ~Gender
##D 
##D d <- lava::sim(m.Sim, 1e2)
##D 
##D 
##D #### calibrate type 1 error on the estimated model ####
##D m <- lvm(Y1~eta,
##D          Y2~eta,
##D          Y3~eta,
##D          eta~Group+Gender)
##D e <- lava::estimate(m, data = d)
##D res <- calibrateType1(e, null = "eta~Group", n.rep = 100)
##D res <- calibrateType1(e, null = "eta~Group", n.rep = 100, cpus = 4)
##D summary(res)
## End(Not run)




