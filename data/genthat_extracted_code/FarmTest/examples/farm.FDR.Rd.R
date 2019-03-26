library(FarmTest)


### Name: farm.FDR
### Title: Control FDR given a list of pvalues
### Aliases: farm.FDR

### ** Examples

set.seed(100)
Y = matrix(rnorm(1000, 0, 1),10)
pval = apply(Y, 1, function(x) t.test(x)$p.value)
farm.FDR(pval, 0.05)
farm.FDR(pval, 0.01, type = "BH")




