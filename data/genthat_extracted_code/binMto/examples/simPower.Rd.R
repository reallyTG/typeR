library(binMto)


### Name: simPower
### Title: Simulation of power for the methods in binmto
### Aliases: simPower simPowerI
### Keywords: htest

### ** Examples


# three groups are to be tested vs. a control
# H0: all treatments have the same proportion of success: H0diff=c(0,0,0)
# proportion of success in the control: 0.2 
# proportions of success in the treatment groups: 0.3,0.4,0.5
# simulate power for balanced designs with 20, 30,...,100 observations
# per group

# create a matrix for the sample sizes to be used for simulation:

ni<-matrix(rep(seq(20,100,10), times=4), ncol=4)
ni


# one-sided, alternative greater:

simPower(H0diff=c(0.1,0.1,0.1), pH1=c(0.2,0.3,0.4,0.5), 
 n=ni, n.sim=1000, alternative="greater")





