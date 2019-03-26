library(NMOF)


### Name: EuropeanCall
### Title: Computing Prices of European Calls with a Binomial Tree
### Aliases: EuropeanCall EuropeanCallBE

### ** Examples

## price
EuropeanCall(  S0 = 100, X = 100, r = 0.02, tau = 1, sigma = 0.20, M = 50)
EuropeanCallBE(S0 = 100, X = 100, r = 0.02, tau = 1, sigma = 0.20, M = 50)

## a Greek: delta
h <- 1e-8
C1 <- EuropeanCall(S0 = 100 + h, X = 100, r = 0.02, tau = 1,
                   sigma = 0.20, M = 50)
C2 <- EuropeanCall(S0 = 100    , X = 100, r = 0.02, tau = 1,
                   sigma = 0.20, M = 50)
(C1 - C2) / h



