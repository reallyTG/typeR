library(RTDE)


### Name: zvalueRTDE
### Title: The Z-value random variable
### Aliases: zvalueRTDE summary.zvalueRTDE print.zvalueRTDE relexcess
###   relexcess.default relexcess.zvalueRTDE
### Keywords: distribution

### ** Examples


#####
# (1) example

omega <- 1/2
m <- 10
n <- 100
obs <- cbind(rupareto(n), rupareto(n)) + rupareto(n)

#unit Pareto transform
zvalueRTDE(obs, omega, output="orig")

relexcess(zvalueRTDE(obs, omega, output="orig"), m)
zvalueRTDE(obs, omega, nbpoint=m, output="relexcess")

		



