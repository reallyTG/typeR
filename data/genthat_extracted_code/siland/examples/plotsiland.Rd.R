library(siland)


### Name: plotsiland
### Title: Plot results from siland function
### Aliases: plotsiland

### ** Examples

## No test: 
data(dataSiland)
data(landSiland)
res=siland(loc.model=y~locfac,land=landSiland,data=dataSiland,sif="exponential",family="gaussian")
plotsiland(res,landSiland, dataSiland)
## End(No test)



