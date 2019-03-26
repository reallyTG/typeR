library(nlme)


### Name: augPred
### Title: Augmented Predictions
### Aliases: augPred augPred.gls augPred.lme augPred.lmList
### Keywords: models

### ** Examples

fm1 <- lme(Orthodont, random = ~1)
augPred(fm1, length.out = 2, level = c(0,1))



