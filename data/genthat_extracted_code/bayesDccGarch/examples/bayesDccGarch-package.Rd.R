library(bayesDccGarch)


### Name: bayesDccGarch-package
### Title: bayesDccGARCH: Methods and tools for Bayesian analysis of
###   DCC-GARCH(1,1) Model.
### Aliases: bayesDccGarch-package
### Keywords: package multivariate DCC-GARCH GARCH Bayes

### ** Examples


data(DaxCacNik)  
Dax = DaxCacNik[,1]

### DCC-GARCH(1,1) ###
out = bayesDccGarch(DaxCacNik[1:10,], nSim=1000) # more data is necessary
summary(out)
plot(out) 

######## using more data and more simulation ###################
### GARCH(1,1) ###
# out = bayesDccGarch(Dax, nSim=20000)
# out2 = window(out, start=5000) # removing the first 5000 as burning
# summary(out2)
# plot(out2$MC) ##ploting Markov chain
# plot(out2)    ##ploting volatilities
 
### DCC-GARCH(1,1) with SSGED innovations ###
# out = bayesDccGarch(DaxCacNik, nSim=20000, tail_ini=1.5, errorDist=3)
# out2 = increaseSim(out, 10000) # more 10000 simulations
# out3 = window(out2, start=5000)  # removing the first 5000 as burning
# summary(out3)
#
### Plotting volatilities #
# plot(out3)
#
### Plotting Markov Chain #
# plot(out3$MC)
#
############################################################

######  log-likelihood function of GARCH(1,1) model with SST innovations ####
logLikDccGarch(Dax, omega=0.03, alpha=0.03, beta=0.8, gamma=0.7)$value

######  log-likelihood function of DCC-GARCH(1,1) model with SST innovations ####
logLikDccGarch(DaxCacNik, omega=c(0.02,0.01,0.03), alpha=c(0.02,0.01,0.03))$value




