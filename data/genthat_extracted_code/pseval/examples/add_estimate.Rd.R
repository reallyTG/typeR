library(pseval)


### Name: add_estimate
### Title: Estimate parameters
### Aliases: add_estimate

### ** Examples

test <- psdesign(generate_example_data(n = 100), Z = Z, Y = Y.obs, S = S.obs, BIP = BIP)
test + integrate_parametric(S.1 ~ BIP) + risk_binary(D = 50) + ps_estimate(method = "BFGS")



