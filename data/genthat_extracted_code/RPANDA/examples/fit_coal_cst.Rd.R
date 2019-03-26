library(RPANDA)


### Name: fit_coal_cst
### Title: Maximum likelihood fit of the equilibrium model
### Aliases: fit_coal_cst

### ** Examples

data(Cetacea)
result <- fit_coal_cst(Cetacea, tau0=1.e-3, gamma=-1, cst.rate=FALSE, N0=89)
print(result)



