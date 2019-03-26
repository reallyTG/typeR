library(sstModel)


### Name: print.nonLifeRisk
### Title: Printing a nonLifeRisk
### Aliases: print.nonLifeRisk

### ** Examples

# Creating a new nonLifeRisk.
nonLife1 <- nonLifeRisk(type     = "simulations",
                        param    = list(simulations = stats::rnorm(100)),
                        currency =  "CHF")
# printing the nonLifeRisk.
print(nonLife1)
# Creating a new nonLifeRisk.
nonLife2 <- nonLifeRisk(type     = "log-normal",
                        param    = list(mu = 1, sigma = 2),
                        currency =  "CHF")
# printing the nonLifeRisk.
print(nonLife2)
# Creating a new nonLifeRisk.
nonLife3 <- nonLifeRisk(type = "cdf",
                        param = list(cdf = data.frame(x = c(0,1,2,3),
                                                      cdf = c(0.3,0.7,0.9, 1))),
                        currency = "CHF")
# printing the nonLifeRisk.
print(nonLife3)




