library(pseval)


### Name: add_riskmodel
### Title: Add risk model to a psdesign object
### Aliases: add_riskmodel

### ** Examples

test <- psdesign(generate_example_data(n = 100), Z = Z, Y = Y.obs, S = S.obs, BIP = BIP) +
     integrate_parametric(S.1 ~ BIP)
add_riskmodel(test, risk_binary())
test + risk_binary() # same as above



