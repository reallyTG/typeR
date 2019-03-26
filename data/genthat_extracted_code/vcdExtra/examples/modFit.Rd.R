library(vcdExtra)


### Name: modFit
### Title: Brief Summary of Model Fit for a glm or loglm Object
### Aliases: modFit modFit.loglm modFit.glm
### Keywords: utilities models

### ** Examples

data(Mental)
require(MASS)
(Mental.tab <- xtabs(Freq ~ ses+mental, data=Mental))
(Mental.mod <- loglm(~ses+mental, Mental.tab))
Mental.mod
modFit(Mental.mod)

# use to label mosaic()
mosaic(Mental.mod, main=paste("Independence model,", modFit(Mental.mod)))



