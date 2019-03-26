library(hiddenf)


### Name: additivityPvalues
### Title: Non-additivity pvalues
### Aliases: additivityPvalues
### Keywords: non-additivity

### ** Examples

library(hiddenf)
data(cjejuni.mtx)
cjejuni.out <- HiddenF(cjejuni.mtx)
pvalues <- additivityPvalues(cjejuni.out)
print(pvalues)



