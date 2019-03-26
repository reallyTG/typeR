library(GeneCycle)


### Name: periodogram
### Title: Periodogram Power Spectral Density
### Aliases: periodogram
### Keywords: ts

### ** Examples

# load GeneCycle library
library("GeneCycle")

# load data set
data(caulobacter)

# how many genes and how many samples?
dim(caulobacter)

# periodograms of the first 10 genes
periodogram(caulobacter[,1:10])



