library(mirt)


### Name: randef
### Title: Compute posterior estimates of random effect
### Aliases: randef
### Keywords: effects random

### ** Examples

## Not run: 
##D #make an arbitrary groups
##D covdat <- data.frame(group = rep(paste0('group', 1:49), each=nrow(Science)/49))
##D 
##D #partial credit model
##D mod <- mixedmirt(Science, covdat, model=1, random = ~ 1|group)
##D summary(mod)
##D 
##D effects <- randef(mod, ndraws = 2000, thin = 20)
##D head(effects$Theta)
##D head(effects$group)
##D 
## End(Not run)



