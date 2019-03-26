library(genalg)


### Name: plot.rbga
### Title: R Based Genetic Algorithm Plot Function
### Aliases: plot.rbga
### Keywords: multivariate

### ** Examples

evaluate <- function(string=c()) {
    returnVal = 1 / sum(string);
    returnVal
}

rbga.results = rbga.bin(size=10, mutationChance=0.01, zeroToOneRatio=0.5,
    evalFunc=evaluate)

plot(rbga.results)
plot(rbga.results, type="hist")



