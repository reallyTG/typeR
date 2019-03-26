library(SoilR)


### Name: fW.Daycent2
### Title: Effects of moisture on decomposition rates according to the
###   DAYCENT model
### Aliases: fW.Daycent2

### ** Examples

W=10:90
fW=fW.Daycent2(W,WP=10,FC=90)
plot(fW,type="l",ylim=c(0,6)) #This plot reproduces Figure 1b, in del Grosso et al. (2005)



