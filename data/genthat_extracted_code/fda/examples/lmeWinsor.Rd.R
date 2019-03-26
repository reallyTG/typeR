library(fda)


### Name: lmeWinsor
### Title: Winsorized Regression with mixed effects
### Aliases: lmeWinsor
### Keywords: models

### ** Examples

requireNamespace('nlme')
fm1w <- lmeWinsor(distance ~ age, data = nlme::Orthodont,
                 random=~age|Subject)
fm1w.1 <- lmeWinsor(distance ~ age, data = nlme::Orthodont,
                 random=~age|Subject, trim=0.1)



