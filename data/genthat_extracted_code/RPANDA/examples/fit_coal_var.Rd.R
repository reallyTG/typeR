library(RPANDA)


### Name: fit_coal_var
### Title: Fit birth-death model using a coalescent approch
### Aliases: fit_coal_var

### ** Examples

data(Cetacea)
result <- fit_coal_var(Cetacea, lamb0=0.01, alpha=-0.001, mu0=0.0, beta=0, N0=89)
print(result)



