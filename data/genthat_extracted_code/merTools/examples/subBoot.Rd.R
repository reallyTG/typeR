library(merTools)


### Name: subBoot
### Title: Bootstrap a subset of an lme4 model
### Aliases: subBoot

### ** Examples

## Not run: 
##D (fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy))
##D resultMatrix <- subBoot(fm1, n = 160, FUN = thetaExtract, R = 20)
## End(Not run)



