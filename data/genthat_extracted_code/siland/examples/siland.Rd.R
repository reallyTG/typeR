library(siland)


### Name: siland
### Title: Estimation of spatial influence of landscape
### Aliases: siland

### ** Examples

## No test: 
data(dataSiland)
data(landSiland)
resE=siland(y~locvar,land=landSiland,data=dataSiland,sif="exponential",family=poisson)
resE
resE$AIC
## End(No test)




