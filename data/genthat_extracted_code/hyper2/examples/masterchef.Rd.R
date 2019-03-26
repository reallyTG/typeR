library(hyper2)


### Name: masterchef
### Title: Masterchef series 6
### Aliases: masterchef MasterChef masterchef_series6 pmax_masterchef6
###   pmax_masterchef6_constrained
### Keywords: datasets

### ** Examples

data(masterchef)

a1 <- rep(1/13,12)                          # equal strengths
a2 <- indep(pmax_masterchef6)               # MLE
a3 <- indep(pmax_masterchef6_constrained)   # constrained MLE

like_series(a1, masterchef_series6)
like_series(a2, masterchef_series6)
like_series(a3, masterchef_series6)




