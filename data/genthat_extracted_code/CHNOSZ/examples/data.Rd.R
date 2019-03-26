library(CHNOSZ)


### Name: thermo
### Title: Thermodynamic Database and System Settings
### Aliases: thermo OBIGT opt element refs groups buffers

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## where are the data files in CHNOSZ?
system.file("data", package="CHNOSZ")
system.file("extdata", package="CHNOSZ")

## exploring thermo$obigt
# what physical states there are
unique(thermo$obigt$state)
# formulas of ten random species
n <- nrow(thermo$obigt)
thermo$obigt$formula[runif(10)*n]



