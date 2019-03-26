library(equateIRT)


### Name: import.ltm
### Title: Import Item Parameters Estimates and Covariance Matrices from
###   IRT Software
### Aliases: import.ltm import.mirt import.irtpro import.flexmirt

### ** Examples


#====================
# from package ltm
library(ltm)

# one-parameter logistic model
mod1pl <- rasch(LSAT)
est.mod1pl <- import.ltm(mod1pl)
est.mod1pl

# two-parameter logistic model
mod2pl <- ltm(LSAT ~ z1)
est.mod2pl <- import.ltm(mod2pl)
est.mod2pl

#====================
# from package mirt
library(mirt)

# one-parameter logistic model
data(LSAT, package = "ltm")
val <- mirt(LSAT, 1, SE = TRUE, pars = "values")
cnstr <- val[val$name == "a1",]$parnum
mod1pl.m <- mirt(LSAT, 1, SE = TRUE, SE.type = 'Richardson', constrain = list(cnstr))
est.mod1pl.m <- import.mirt(mod1pl.m, digits = 4)
est.mod1pl.m

# two-parameter logistic model
data(LSAT, package = "ltm")
mod2pl.m <- mirt(LSAT, 1, SE = TRUE, SE.type = 'Richardson')
est.mod2pl.m <- import.mirt(mod2pl.m, display = FALSE)
est.mod2pl.m




