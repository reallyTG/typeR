library(siland)


### Name: plotcontri
### Title: Plot contributions
### Aliases: plotcontri

### ** Examples

## No test: 
data(landSiland)
data(dataSiland)
res=siland(y~locvar,land=landSiland,data=dataSiland,sif="exponential",family=gaussian)
plotcontri(res,landSiland,dataSiland)

plotcontri(res,landSiland,dataSiland,type=1)
plotcontri(res,landSiland,dataSiland,numvar=2)
## End(No test)



