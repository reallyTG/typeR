library(siland)


### Name: plotsiland.sif
### Title: Plot the estimated spatial influence functions.
### Aliases: plotsiland.sif

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
## No test: 
data(dataSiland)
data(landSiland)
resE=siland(y~locvar,land=landSiland,data=dataSiland,sif="exponential",family=gaussian)
plotsiland.sif(x=resE)
## End(No test)




