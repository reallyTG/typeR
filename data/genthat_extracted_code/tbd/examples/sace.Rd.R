library(tbd)


### Name: sace
### Title: Estimation of causal effects with outcomes truncated by death
### Aliases: sace

### ** Examples

attach(simulated_data)
X <- cbind(X.X1, X.V2, X.V3)
sace.result <- sace(Z, S, Y, X, A)
sace



