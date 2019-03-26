library(lavaSearch2)


### Name: skeleton
### Title: Pre-computation for the Score
### Aliases: skeleton skeleton.lvm skeleton.lvmfit skeletonDtheta
###   skeletonDtheta.gls skeletonDtheta.lme skeletonDtheta.lvm
###   skeletonDtheta.lvmfit skeletonDtheta2 skeletonDtheta2.gls
###   skeletonDtheta2.lme skeletonDtheta2.lm skeletonDtheta2.lvm
###   skeletonDtheta2.lvmfit
### Keywords: internal

### ** Examples

## Not run: 
##D skeleton <- lavaSearch2::skeleton
##D skeleton.lvm <- lavaSearch2::skeleton.lvm
##D skeleton.lvmfit <- lavaSearch2::skeleton.lvmfit
##D 
##D ## without constrain
##D m <- lvm(Y1~X1+X2+eta,Y2~X3+eta,Y3~eta)
##D latent(m) <- ~eta
##D 
##D e <- estimate(m, lava::sim(m,1e2))
##D M.data <- as.matrix(model.frame(e))
##D 
##D skeleton(e$model, as.lava = TRUE,
##D          name.endogenous = endogenous(e), n.endogenous = 3,
##D          name.latent = latent(e), 
##D          update.value = FALSE)
##D skeleton(e, data = M.data, p = pars(e), as.lava = TRUE,
##D          name.endogenous = endogenous(e), n.endogenous = 3,
##D          name.latent = latent(e), 
##D          update.value = TRUE)
##D 
##D ## with constrains
##D m <- lvm(Y[mu:sigma] ~ beta*X1+X2)
##D e <- estimate(m, lava::sim(m,1e2))
##D M.data <- as.matrix(model.frame(e))
##D 
##D skeleton(e$model, as.lava = TRUE,
##D          name.endogenous = "Y", n.endogenous = 1,
##D          name.latent = NULL, 
##D          update.value = FALSE)$skeleton
##D 
##D skeleton(e, data = M.data, p = pars(e), as.lava = FALSE,
##D          name.endogenous = "Y", n.endogenous = 1,
##D          name.latent = NULL, 
##D          update.value = FALSE)$skeleton
##D 
## End(Not run)



