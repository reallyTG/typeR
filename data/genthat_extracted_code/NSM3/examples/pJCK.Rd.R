library(NSM3)


### Name: pJCK
### Title: Function to compute the P-value for the observed
###   Jonckheere-Terpstra J statistic.
### Aliases: pJCK
### Keywords: Jonckheere-Terpstra

### ** Examples

##Hollander-Wolfe-Chicken Example 6.2 Motivational Effect of Knowledge of Performance
motivational.effect<-list(no.Info=c(40,35,38,43,44,41),rough.Info=c(38,40,47,44,40,42),
                          accurate.Info=c(48,40,45,43,46,44))
#pJCK(motivational.effect,method="Monte Carlo")
pJCK(motivational.effect,method="Asymptotic")



