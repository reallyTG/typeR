library(PKNCA)


### Name: pk.calc.auxc
### Title: A compute the Area Under the (Moment) Curve
### Aliases: pk.calc.auxc pk.calc.auc pk.calc.aumc pk.calc.auc.last
###   pk.calc.auc pk.calc.auc.last pk.calc.auc.inf pk.calc.auc.inf.obs
###   pk.calc.auc.inf.pred pk.calc.auc.all pk.calc.aumc pk.calc.aumc.last
###   pk.calc.aumc.inf pk.calc.aumc.inf.obs pk.calc.aumc.inf.pred
###   pk.calc.aumc.all

### ** Examples

myconc <- c(0, 1, 2, 1, 0.5, 0.25, 0)
mytime <- c(0, 1, 2, 3, 4,   5,    6)
pk.calc.auc(myconc, mytime, interval=c(0, 6))
pk.calc.auc(myconc, mytime, interval=c(0, Inf))



