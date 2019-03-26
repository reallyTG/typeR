library(ercv)


### Name: cvplot
### Title: Exploratory empirical residual coefficient of variation
### Aliases: cvplot
### Keywords: ercv

### ** Examples

data("moby", package = "poweRlaw")
cvplot(moby, main="MobyDick")

data(d1)
cvplot(d1, threshold=median(d1), main="D1") 



