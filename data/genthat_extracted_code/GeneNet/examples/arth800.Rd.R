library(GeneNet)


### Name: arth800
### Title: Time Series Expression Data for 800 Arabidopsis Thaliana Genes
### Aliases: arth800 arth800.descr arth800.expr arth800.mexpr arth800.name
###   arth800.probe arth800.symbol
### Keywords: datasets

### ** Examples

# load GeneNet library
library("GeneNet")

# load data set
data(arth800)

is.longitudinal(arth800.expr)
summary(arth800.expr)

# plot first nine time series
plot(arth800.expr, 1:9)



