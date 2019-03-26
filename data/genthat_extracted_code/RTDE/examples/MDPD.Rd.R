library(RTDE)


### Name: MDPD
### Title: The Minimum Distance Power Divergence statistics
### Aliases: MDPD
### Keywords: distribution

### ** Examples


#####
# (1) small example

omega <- 1/2
m <- 10
n <- 100
obs <- cbind(rupareto(n), rupareto(n)) + rupareto(n)

#unit Pareto transform
z <- zvalueRTDE(obs, omega, nbpoint=m, output="relexcess")

MDPD(c(1/2, 1/4), dEPD, z$Z, alpha=0, rho=-1)




		



