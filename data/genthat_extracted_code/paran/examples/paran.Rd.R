library(paran)


### Name: paran
### Title: Horn's Parallel Analysis of Principal Components/Factors
### Aliases: paran
### Keywords: multivariate

### ** Examples

## perform a standard parallel analysis on the US Arrest data
paran(USArrests, iterations=5000)

## a conservative analysis with different result!
paran(USArrests, iterations=5000, centile=95)



