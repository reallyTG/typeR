library(glmmTMB)


### Name: getReStruc
### Title: Calculate random effect structure Calculates number of random
###   effects, number of parameters, blocksize and number of blocks.
###   Mostly for internal use.
### Aliases: getReStruc

### ** Examples

data(sleepstudy, package="lme4")
rt <- lme4::lFormula(Reaction~Days+(1|Subject)+(0+Days|Subject),
                    sleepstudy)$reTrms
rt2 <- lme4::lFormula(Reaction~Days+(Days|Subject),
                    sleepstudy)$reTrms
getReStruc(rt)



