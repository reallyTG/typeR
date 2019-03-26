library(pseval)


### Name: add_integration
### Title: Integration models
### Aliases: add_integration

### ** Examples


test <- psdesign(generate_example_data(n = 100), Z = Z, Y = Y.obs, S = S.obs, BIP = BIP)
add_integration(test, integrate_parametric(S.1 ~ BIP))
test + integrate_parametric(S.1 ~ BIP)  # same as above




