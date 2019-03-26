library(merTools)


### Name: REsdExtract
### Title: Extract the standard deviation of the random effects from a
###   merMod object
### Aliases: REsdExtract

### ** Examples

fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
REsdExtract(fm1)



