library(tangram)


### Name: cell.htest
### Title: Construct hypothesis test cell
### Aliases: cell.htest

### ** Examples

cell(cor.test(rnorm(10), rnorm(10), method="spearman"))
cell(cor.test(rnorm(10), rnorm(10)))
cell(chisq.test(rpois(10,1)))
cell(t.test(rnorm(10), rnorm(10)))



