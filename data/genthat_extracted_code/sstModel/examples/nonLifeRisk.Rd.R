library(sstModel)


### Name: nonLifeRisk
### Title: Constructing a nonLifeRisk
### Aliases: nonLifeRisk

### ** Examples

# Creating new nonLifeRisks.
nonLife1 <- nonLifeRisk(type     = "simulations",
                        param    = list(simulations = stats::rnorm(100)),
                        currency =  "CHF")
nonLife2 <- nonLifeRisk(type     = "log-normal",
                        param    = list(mu = 1, sigma = 2),
                        currency =  "CHF")
nonLife3 <- nonLifeRisk(type = "cdf",
                        param = list(cdf = data.frame(x = c(0,1,2,3),
                                                      cdf = c(0.3,0.7,0.9, 1))),
                        currency = "CHF")




