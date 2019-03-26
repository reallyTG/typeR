library(PMCMRplus)


### Name: NPMTest
### Title: All-Pairs Comparisons for Simply Ordered Mean Ranksums
### Aliases: NPMTest NPMTest.default NPMTest.formula
### Keywords: htest nonparametric

### ** Examples

## Example from Sachs (1997, p. 402)
x <- c(106, 114, 116, 127, 145,
       110, 125, 143, 148, 151,
       136, 139, 149, 160, 174)
g <- gl(3,5)
levels(g) <- c("A", "B", "C")
NPMTest(x, g)




