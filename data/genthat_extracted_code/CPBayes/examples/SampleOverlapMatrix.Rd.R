library(CPBayes)


### Name: SampleOverlapMatrix
### Title: An example data of sample-overlap matrices.
### Aliases: SampleOverlapMatrix
### Keywords: datasets

### ** Examples

data(SampleOverlapMatrix)
n11 <- SampleOverlapMatrix$n11
n11
n00 <- SampleOverlapMatrix$n00
n00
n10 <- SampleOverlapMatrix$n10
n10
## No test: 
estimate_corln(n11,n00,n10)
## End(No test)



