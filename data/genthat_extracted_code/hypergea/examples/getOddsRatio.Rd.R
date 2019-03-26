library(hypergea)


### Name: getOddsRatio
### Title: Odds ratio
### Aliases: getOddsRatio
### Keywords: contingency table odds ratio

### ** Examples

CT <- matrix(c(1:4), nrow=2)
getOddsRatio(CT)

CT <- array(c(1:8), dim=c(2,2,2))
getOddsRatio(CT)



