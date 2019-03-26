library(genalg)


### Name: summary.rbga
### Title: R Based Genetic Algorithm Summary Function
### Aliases: summary.rbga
### Keywords: multivariate

### ** Examples

evaluate <- function(string=c()) {
    returnVal = 1 / sum(string);
    returnVal
}

rbga.results = rbga.bin(size=10, mutationChance=0.01, zeroToOneRatio=0.5,
    evalFunc=evaluate)

summary(rbga.results)



