library(fullfact)


### Name: powerLmer
### Title: Power analysis for normal data
### Aliases: powerLmer

### ** Examples

#100 simulations
#pwr_L1<- powerLmer(varcomp=c(0.19,0.03,0.02,0.76),nval=c(10,10,20))
#pwr_L1
#5simulations
pwr_L1<- powerLmer(varcomp=c(0.19,0.03,0.02,0.76),nval=c(10,10,20),nsim=5)
pwr_L1



