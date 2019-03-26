library(raters)


### Name: raters-package
### Title: A Modification of Fleiss' Kappa in case of Nominal and Ordinal
###   Variables
### Aliases: raters-package raters
### Keywords: datasets

### ** Examples

# Nominal data
data(diagnostic)
concordance(diagnostic,test="Normal")

# Ordinal data with linear weights
data(winetable)
set.seed(12345)
wlin.conc(winetable,test="MC")

# Ordinal data with quadratic weights
data(winetable)
set.seed(12345)
wquad.conc(winetable,test="MC")



