library(bnlearn)


### Name: alpha.star
### Title: Estimate the optimal imaginary sample size for BDe(u)
### Aliases: alpha.star
### Keywords: structure learning network scores

### ** Examples

data(learning.test)
dag = hc(learning.test, score = "bic")

for (i in 1:3) {

  a = alpha.star(dag, learning.test)
  dag = hc(learning.test, score = "bde", iss = a)

}#FOR



