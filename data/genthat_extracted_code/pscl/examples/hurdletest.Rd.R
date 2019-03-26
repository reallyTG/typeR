library(pscl)


### Name: hurdletest
### Title: Testing for the Presence of a Zero Hurdle
### Aliases: hurdletest
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm <- hurdle(art ~ ., data = bioChemists, dist = "negbin", zero = "negbin")
hurdletest(fm)



