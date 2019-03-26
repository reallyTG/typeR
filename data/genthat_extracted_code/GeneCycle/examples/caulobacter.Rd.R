library(GeneCycle)


### Name: caulobacter
### Title: Microarray Time Series Data for 1444 Caulobacter Crescentus
###   Genes
### Aliases: caulobacter
### Keywords: datasets

### ** Examples

# load GeneCycle library
library("GeneCycle")

# load data set
data(caulobacter)
is.longitudinal(caulobacter)

# how many samples and how many genes?
dim(caulobacter)
summary(caulobacter)
get.time.repeats(caulobacter)

# plot first nine time series
plot(caulobacter, 1:9)



