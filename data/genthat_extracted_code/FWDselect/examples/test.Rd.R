library(FWDselect)


### Name: test
### Title: Bootstrap based test for covariate selection
### Aliases: test

### ** Examples

library(FWDselect)
data(diabetes)
x = diabetes[ ,2:11]
y = diabetes[ ,1]
test(x, y, method = "lm", cluster = FALSE, nboot = 5)

## for speedup = FALSE
# obj2 = qselection(x, y, qvector = c(1:9), method = "lm",
# cluster = FALSE)
# plot(obj2) # we choose q = 7 for the argument qmin
# test(x, y, method = "lm", cluster = FALSE, nboot = 5,
# speedup = FALSE, qmin = 7)




