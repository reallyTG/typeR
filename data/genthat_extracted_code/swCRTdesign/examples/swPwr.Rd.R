library(swCRTdesign)


### Name: swPwr
### Title: Power of Stepped Wedge Cluster Randomized Trial (SW CRT)
### Aliases: swPwr
### Keywords: power stepped wedge cluster randomized trial

### ** Examples

library(swCRTdesign)
# Example 1 (Random Intercepts Only, standard Stepped Wedge (SW) design)
swPwr.Ex1.RIO.std <- swPwr(swDsn(c(6,6,6,6)), distn="binomial", 
n=120, mu0=0.05, mu1=0.035, tau=0.01, eta=0, rho=0, alpha=0.05, retDATA=FALSE)
swPwr.Ex1.RIO.std

# Example 2 (Random Intercepts Only, extended SW design)
swPwr.Ex1.RIO.extend <- swPwr(swDsn(c(6,6,6,6), extra.time=3), distn="binomial", 
n=120, mu0=0.05, mu1=0.035, tau=0.01, eta=0, rho=0, 
alpha=0.05, retDATA=FALSE)
swPwr.Ex1.RIO.extend

# Example 3 (Independent Random Intercepts and Treatment effects, standard SW design)
swPwr.Ex1.IRIS <- swPwr(swDsn(c(6,6,6,6)), distn="binomial", 
n=120, mu0=0.05, mu1=0.035, tau=0.01, eta=0.0045, rho=0,  
alpha=0.05, retDATA=FALSE)
swPwr.Ex1.IRIS


# Example 4 (Correlated Random Intercepts and Slopes, standard SW design)
swPwr.Ex1.CRIS <- swPwr(swDsn(c(6,6,6,6)), distn="binomial", 
n=120, mu0=0.05, mu1=0.035, tau=0.01, eta=0.0045, rho=0.4,  
alpha=0.05, retDATA=FALSE)
swPwr.Ex1.CRIS




