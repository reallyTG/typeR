library(bayesDccGarch)


### Name: bayesDccGarch
### Title: Bayesian Estimation of the DCC-GARCH(1,1) Model.
### Aliases: bayesDccGarch increaseSim window.bayesDccGarch window
### Keywords: ts multivariate dcc-garch garch models

### ** Examples


data(DaxCacNik)  
Dax = DaxCacNik[,1]

### DCC-GARCH(1,1) ###
out = bayesDccGarch(DaxCacNik[1:10,], nSim=1000) # more data is necessary
summary(out)
plot(out) 


### GARCH(1,1) ###
# out = bayesDccGarch(Dax)
# summary(out)
# plot(out) 	


### DCC-GARCH(1,1) with SSGED innovations ###
## out = bayesDccGarch(DaxCacNik, tail_ini=1.5, errorDist=3)


### Informative Prior for alpha and beta parameters ###
# out = bayesDccGarch(Dax, alpha_ini=0.01, beta_ini=0.90, 
#	control=list(mu_alpha=0.01, sigma_alpha=0.001, mu_beta=0.90, sigma_beta=0.001))
# summary(out)
# plot(out$MC) ## plot Markov Chain
# plot(out) 	

### more simulations ###################################
# out1 = bayesDccGarch(DaxCacNik)
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
########################################################



