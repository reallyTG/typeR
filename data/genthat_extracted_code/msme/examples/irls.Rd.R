library(msme)


### Name: irls
### Title: Function to fit generalized linear models using IRLS.
### Aliases: irls
### Keywords: ~models

### ** Examples

data(medpar)

irls.poi <- irls(los ~ hmo + white,
                 family = "poisson",
                 link = "log",
                 data = medpar)
summary(irls.poi)

irls.probit <- irls(died ~ hmo + white,
                    family = "binomial",
                    link = "probit",
                    data = medpar)
summary(irls.probit)




