library(HardyWeinberg)


### Name: UniqueGenotypeCounts
### Title: Extract unique genotypic compositions from a matrix
### Aliases: UniqueGenotypeCounts
### Keywords: misc

### ** Examples

set.seed(123)
X <- HWData(n=100,nm=100)
print(nrow(X))
Y <- UniqueGenotypeCounts(X)
print(nrow(Y))
print(sum(Y$w))



