library(nutshell)


### Name: consumption
### Title: Per capita US Food Consumption 1980-2005
### Aliases: consumption
### Keywords: datasets

### ** Examples

data(consumption)
library(lattice)
dotplot(
  Amount ~ Year | Food,
  data=consumption,
  aspect="xy",
  scales=list(relation="sliced", cex=.4)
)



