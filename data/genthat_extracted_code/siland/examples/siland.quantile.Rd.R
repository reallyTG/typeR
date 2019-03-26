library(siland)


### Name: siland.quantile
### Title: Quantile computation for spatial influence functions
### Aliases: siland.quantile

### ** Examples

## No test: 
data(dataSiland)
data(landSiland)
resE=siland(y~locvar,land=landSiland,data=dataSiland,sif="exponential",family=gaussian)
siland.quantile(x=resE,p=c(0.5,0.95))
## End(No test)




