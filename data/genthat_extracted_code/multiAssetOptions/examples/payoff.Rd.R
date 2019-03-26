library(multiAssetOptions)


### Name: payoff
### Title: Multi-Asset Option Payoff Calculator
### Aliases: payoff

### ** Examples

# payoff of a dual-asset digital call with strikes at 100 and 90.
S <- list(seq(0, 500, by=1), seq(0, 500, by=1))
payoff(0, c(0, 0), c(100, 90), S)



