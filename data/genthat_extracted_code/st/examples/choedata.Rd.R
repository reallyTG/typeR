library(st)


### Name: choedata
### Title: A Subset of the Choe et al. (2005) "Golden Spike" Experiment
### Aliases: choe2.mat choe2.L ' choe2.degenes' ' choe2.mapping' '
###   choe2.probe.name' choe2.symbol.name
### Keywords: datasets

### ** Examples

# load st library
library("st")

# load data set
data(choedata)

# 6 samples, 11,475 genes
dim(choe2.mat)

# two groups (case vs. control
choe2.L

# 1,331 differentially expressed genes
sum(choe2.degenes)

# further information on genes
choe2.symbol.name
choe2.probe.name
choe2.mapping 



