library(qtl)


### Name: cleanGeno
### Title: Delete genotypes that are possibly in error
### Aliases: cleanGeno
### Keywords: utilities

### ** Examples

data(hyper)
sum(ntyped(hyper))
hyperc <- cleanGeno(hyper, chr=4, maxdist=c(2.5, 10), maxmark=c(2, 1))
sum(ntyped(hyperc))



