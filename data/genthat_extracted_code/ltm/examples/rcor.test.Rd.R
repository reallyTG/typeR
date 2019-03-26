library(ltm)


### Name: rcor.test
### Title: Pairwise Associations between Items using a Correlation
###   Coefficient
### Aliases: rcor.test
### Keywords: multivariate

### ** Examples


## pairwise associations for Environment data:
rcor.test(data.matrix(Environment), method = "kendall")

## pairwise associations for independent normal random variates:
mat <- matrix(rnorm(1000), 100, 10, dimnames = list(NULL, LETTERS[1:10]))
rcor.test(mat)
rcor.test(mat, method = "kendall")
rcor.test(mat, method = "spearman")




