library(GeneCycle)


### Name: dominant.freqs
### Title: Dominant Frequencies in Multiple (Genetic) Time Series
### Aliases: dominant.freqs
### Keywords: ts

### ** Examples

# load GeneCycle library
library("GeneCycle")

# load data set
data(caulobacter)

# how many samples and how many genes?
dim(caulobacter)

# first three dominant frequencies for each gene
dominant.freqs(caulobacter, 3)

# first four dominant frequencies for gene no. 1000
dominant.freqs(caulobacter[,1000], 4)



