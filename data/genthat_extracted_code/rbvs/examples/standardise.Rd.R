library(rbvs)


### Name: standardise
### Title: Standardise data
### Aliases: standardise

### ** Examples

x <- matrix(rnorm(100*10), nrow = 100, ncol = 10)
x <- standardise(x)
standard.deviations <- apply(x,2,sd)
print(standard.deviations)



