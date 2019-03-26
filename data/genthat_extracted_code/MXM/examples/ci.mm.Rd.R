library(MXM)


### Name: Symmetric conditional independence test with mixed data
### Title: Symmetric conditional independence test with mixed data
### Aliases: ci.mm ci.fast ci.mm2 ci.fast2

### ** Examples

ci.mm(1, 2, dat = iris)
ci.mm(1, 5, dat = iris)
ci.fast(1, 5, dat = iris)
x <- iris
x[, 5] <- as.numeric(x[ ,5])  ## Caution:: this will be treated as ordered variable. 
x[, 5] <- factor(x[, 5], ordered = TRUE)
## ci.mm2 and ci.fast2 do not perform multinomial regression.
ci.mm2(1, 5, suffStat = list(dataset = x) )
ci.fast2(1, 5, suffStat = list(dataset = x) )



