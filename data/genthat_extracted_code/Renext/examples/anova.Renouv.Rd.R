library(Renext)


### Name: anova.Renouv
### Title: Compute an analysis of deviance table for two nested Renouv
###   objects
### Aliases: anova.Renouv

### ** Examples

## test using historical data
fit1Exp <- Renouv(Garonne,  distname.y = "exponential", plot = FALSE)
fit1GPD <- Renouv(Garonne, distname.y = "GPD", plot = FALSE)
anova(fit1Exp, fit1GPD)

## test without using historical data
x <- Garonne$OTdata$Flow
dur <- Garonne$OTinfo$effDuration

fit2Exp <- Renouv(x,  threshold = 2700,  effDuration = dur,
                  distname.y = "exponential", plot = FALSE)
fit2GPD <- Renouv(x, threshold = 2700, effDuration = dur,
                  distname.y = "GPD", plot = FALSE)
anova(fit2Exp, fit2GPD)



