library(fdrtool)


### Name: pvalues
### Title: Example p-Values
### Aliases: pvalues
### Keywords: datasets

### ** Examples

# load fdrtool library
library("fdrtool")

# load data set
data(pvalues)

# estimate density and distribution function, 
# and compute corresponding (local) false discovery rates
fdrtool(pvalues, statistic="pvalue")



