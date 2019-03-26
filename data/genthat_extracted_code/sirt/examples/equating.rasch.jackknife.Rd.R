library(sirt)


### Name: equating.rasch.jackknife
### Title: Jackknife Equating Error in Generalized Logistic Rasch Model
### Aliases: equating.rasch.jackknife
### Keywords: Equating Linking

### ** Examples

#############################################################################
# EXAMPLE 1: Linking errors PISA study
#############################################################################

data(data.pisaPars)
pars <- data.pisaPars

# Linking error: Jackknife unit is the testlet
vars <- c("testlet","study1","study2","item")
res1 <- sirt::equating.rasch.jackknife(pars[, vars])
res1$descriptives
  ##   N.items N.units      shift        SD linkerror.jackknife SE.SD.jackknife
  ## 1      25       8 0.09292838 0.1487387          0.04491197      0.03466309

# Linking error: Jackknife unit is the item
res2 <- sirt::equating.rasch.jackknife(pars[, vars ] )
res2$descriptives
  ##   N.items N.units      shift        SD linkerror.jackknife SE.SD.jackknife
  ## 1      25      25 0.09292838 0.1487387          0.02682839      0.02533327



