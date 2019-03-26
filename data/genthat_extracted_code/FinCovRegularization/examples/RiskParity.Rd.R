library(FinCovRegularization)


### Name: RiskParity
### Title: Risk Parity Portfolio
### Aliases: RiskParity

### ** Examples

data(m.excess.c10sp9003)
assets <- m.excess.c10sp9003[,1:10]
RiskParity(cov(assets))



