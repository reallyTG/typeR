library(lava)


### Name: vars
### Title: Extract variable names from latent variable model
### Aliases: vars vars.lvm vars.lvmfit latent latent<- latent.lvm
###   latent<-.lvm latent.lvmfit latent.multigroup manifest manifest.lvm
###   manifest.lvmfit manifest.multigroup exogenous exogenous<-
###   exogenous.lvm exogenous<-.lvm exogenous.lvmfit exogenous.multigroup
###   endogenous endogenous.lvm endogenous.lvmfit endogenous.multigroup
### Keywords: models regression

### ** Examples


g <- lvm(eta1 ~ x1+x2)
regression(g) <- c(y1,y2,y3) ~ eta1
latent(g) <- ~eta1
endogenous(g)
exogenous(g)
identical(latent(g), setdiff(vars(g),manifest(g)))




