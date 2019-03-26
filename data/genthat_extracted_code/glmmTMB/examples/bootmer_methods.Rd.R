library(glmmTMB)


### Name: isLMM.glmmTMB
### Title: support methods for parametric bootstrapping
### Aliases: isLMM.glmmTMB refit.glmmTMB

### ** Examples

if (requireNamespace("lme4")) {
## Not run: 
##D    fm1 <- glmmTMB(count~mined+(1|spp),
##D                   ziformula=~mined,
##D                   data=Salamanders,
##D                   family=nbinom1)
##D    b1 <- lme4::bootMer(fm1, FUN=function(x) fixef(x)$zi, nsim=20, .progress="txt")
##D    if (requireNamespace("boot")) {
##D       boot.ci(b1,type="perc")
##D     }
## End(Not run)
}



