library(GeneNet)


### Name: ecoli
### Title: Microarray Time Series Data for 102 E. Coli Genes Genes
### Aliases: ecoli
### Keywords: datasets

### ** Examples

# load GeneNet library
library("GeneNet")

# load data set
data(ecoli)
is.longitudinal(ecoli)

# how many samples and how many genes?
dim(ecoli)
summary(ecoli)
get.time.repeats(ecoli)

# plot first nine time series
plot(ecoli, 1:9)



