library(CVST)


### Name: cochranq.test
### Title: Cochran's Q Test with Permutation
### Aliases: cochranq.test

### ** Examples

mat = matrix(c(rep(0, 10), 1, 1, 0, 0, 0, 1, 0, 0, 0, 0,
1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1,
0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0,
1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1), ncol=4)
cochranq.test(mat)
mat = matrix(c(rep(0, 7), 1, rep(0, 12), 1, 1, 0, 1,
rep(0, 5), 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1), nrow=8)
cochranq.test(mat)



