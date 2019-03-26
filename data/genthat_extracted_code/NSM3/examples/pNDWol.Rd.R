library(NSM3)


### Name: pNDWol
### Title: Nemenyi, Damico-Wolfe
### Aliases: pNDWol
### Keywords: Nemenyi Damico-Wolfe

### ** Examples

##Hollander-Wolfe-Chicken Example 6.8 Motivational Effect of Knowledge of Performance
motivational.effect<-list(no.Info = c(40, 35, 38, 43, 44, 41), 
rough.Info = c(38, 40, 47, 44, 40, 42), 
accurate.Info = c(48, 40, 45, 43, 46, 44))

pNDWol(motivational.effect,method="Asymptotic")
pNDWol(motivational.effect,method="Monte Carlo")



