library(siland)


### Name: plotsiland.land
### Title: Spatial representation of the landscape influence
### Aliases: plotsiland.land

### ** Examples

## No test: 
data(dataSiland)
data(landSiland)
resE=siland(y~locvar,land=landSiland,data=dataSiland,sif="exponential",family=gaussian)

plotsiland.land(x=resE,land=landSiland,data=dataSiland)
plotsiland.land(x=resE,land=landSiland,data=dataSiland,var=1,lw=20)
## End(No test)



