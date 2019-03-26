library(StMoMo)


### Name: simulate.bootStMoMo
### Title: Simulate future sample paths from a Bootstrapped Stochastic
###   Mortality Model
### Aliases: simulate.bootStMoMo

### ** Examples

#Long computing times
## Not run: 
##D #Lee-Carter: Compare projection with and without parameter uncertainty
##D library(fanplot)
##D LCfit <- fit(lc(), data = EWMaleData)
##D LCResBoot <- bootstrap(LCfit, nBoot = 500)
##D LCResBootsim <- simulate(LCResBoot)
##D LCsim <- simulate(LCfit, nsim = 500) 
##D plot(LCfit$years, log(LCfit$Dxt / LCfit$Ext)["10", ], 
##D      xlim = range(LCfit$years, LCsim$years),
##D      ylim = range(log(LCfit$Dxt / LCfit$Ext)["10", ], 
##D                   log(LCsim$rates["10", , ])),
##D      type = "l", xlab = "year", ylab = "log rate", 
##D      main = "Mortality rate projection at age 10 with and without parameter uncertainty") 
##D fan(t(log(LCResBootsim$rates["10", , ])),start = LCResBootsim$years[1], 
##D     probs = c(2.5, 10, 25, 50, 75, 90, 97.5), n.fan = 4, 
##D     fan.col = colorRampPalette(c(rgb(0, 0, 1), rgb(1, 1, 1))), ln = NULL)
##D fan(t(log(LCsim$rates["10", 1:(length(LCsim$years) - 3), ])),
##D     start = LCsim$years[1], probs = c(2.5, 10, 25, 50, 75, 90, 97.5),
##D     n.fan = 4, fan.col = colorRampPalette(c(rgb(1, 0, 0), rgb(1, 1, 1))), 
##D     ln = NULL)
## End(Not run)




