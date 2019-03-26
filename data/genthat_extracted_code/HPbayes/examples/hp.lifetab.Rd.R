library(HPbayes)


### Name: hp.lifetab
### Title: Heligman-Pollard life table conversion
### Aliases: hp.lifetab
### Keywords: misc

### ** Examples

##requires a set of Heligman-Pollard parameters##
theta <- cbind(0.06008, 0.31087, 0.34431, 0.00698,
           1.98569, 26.71071, 0.00022, 1.08800)
age <- seq(0, 85, 1)
nax <- rep(.5, length(age))
HP.lt <- hp.lifetab(hpp=theta, nax=nax)




