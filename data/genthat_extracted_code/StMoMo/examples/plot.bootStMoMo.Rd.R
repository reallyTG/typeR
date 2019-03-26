library(StMoMo)


### Name: plot.bootStMoMo
### Title: Plot bootstrapped parameters of a Stochastic Mortality Model
### Aliases: plot.bootStMoMo

### ** Examples

#Long computing times
## Not run: 
##D CBDfit <- fit(cbd(), data = central2initial(EWMaleData),
##D               ages.fit = 55:89)
##D CBDResBoot <- bootstrap(CBDfit, nBoot = 500)
##D plot(CBDResBoot)
##D plot(CBDResBoot, parametricbx = FALSE, probs = seq(2.5, 97.5, 2.5))
## End(Not run)




