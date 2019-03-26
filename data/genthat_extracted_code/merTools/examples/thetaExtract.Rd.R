library(merTools)


### Name: thetaExtract
### Title: Extract theta parameters from a merMod model
### Aliases: thetaExtract

### ** Examples

(fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy))
thetaExtract(fm1) #(a numeric vector of the covariance parameters)



