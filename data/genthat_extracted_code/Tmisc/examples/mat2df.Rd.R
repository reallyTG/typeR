library(Tmisc)


### Name: mat2df
### Title: Matrix to pairwise data frame
### Aliases: mat2df

### ** Examples

set.seed(42)
M <- matrix(rnorm(25), nrow=5)
M
mat2df(M)
M <- matrix(rnorm(25), nrow=5, dimnames=list(letters[1:5], letters[1:5]))
M
mat2df(M)
  



