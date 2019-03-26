library(FinancialMath)


### Name: bls.order1
### Title: Black Scholes First-order Greeks
### Aliases: bls.order1
### Keywords: greeks call put option

### ** Examples

x <- bls.order1(S=100, K=110, r=.05, t=1, sd=.1, D=0)
ThetaPut <- x["Theta","Put"]
DeltaCall <- x[2,1]



