library(longitudinal)


### Name: tcell
### Title: Microarray Time Series Data for T-Cell Activation
### Aliases: tcell tcell.10 tcell.34 tcell.gene.description
### Keywords: datasets

### ** Examples

# load "longitudinal" library
library("longitudinal")

# load data sets
data(tcell)

# data set with 10 repeats 
dim(tcell.10)
summary(tcell.10)
is.longitudinal(tcell.10)
is.regularly.sampled(tcell.10)
is.equally.spaced(tcell.10)
get.time.repeats(tcell.10)

# data set with 34 repeats 
dim(tcell.34)
summary(tcell.34)
is.longitudinal(tcell.34)
is.regularly.sampled(tcell.34)
is.equally.spaced(tcell.34)
get.time.repeats(tcell.34)

# descriptions of the first nine genes
tcell.gene.description[1:9]

# plot the first nine time series
plot(tcell.10, 1:9)
plot(tcell.34, 1:9)

# Rangel et al. use the combined data set
tcell.44 <- combine.longitudinal(tcell.34, tcell.10)
plot(tcell.44, 1:9)



