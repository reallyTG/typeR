library(NSM3)


### Name: pHaySton
### Title: Hayter-Stone
### Aliases: pHaySton
### Keywords: Hayter-Stone

### ** Examples

##Hollander, Wolfe, Chicken Example 6.7 Motivational Effect of Knowledge of Performance:
motivational.effect<-list(no.Info = c(40, 35, 38, 43, 44, 41), rough.Info = c(38, 
40, 47, 44, 40, 42), accurate.Info = c(48, 40, 45, 43, 46, 44
))

#pHaySton(motivational.effect,method="Monte Carlo")
pHaySton(motivational.effect,method="Asymptotic")
#pHaySton(rnorm(10),rep(1:3,c(3,3,4)),method="Asymptotic")



