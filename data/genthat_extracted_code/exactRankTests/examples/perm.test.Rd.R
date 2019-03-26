library(exactRankTests)


### Name: perm.test
### Title: One and Two Sample Permutation Test
### Aliases: perm.test perm.test.default perm.test.formula
### Keywords: htest

### ** Examples


# Example from Gardner & Altman (1989), p. 30
# two treatments A and B, 1 means improvement, 0 means no improvement
# confidence sets cf. R\"ohmel (1996)

A <- c(rep(1, 61), rep(0, 19))
B <- c(rep(1, 45), rep(0, 35))
perm.test(A, B, conf.int=TRUE, exact=TRUE)

# one-sample AIDS data (differences only), Methta and Patel (2001),
# Table 8.1 page 181

data(sal)
attach(sal)
ppdiff <- pre - post
detach(sal)

# p-values in StatXact == 0.0011 one-sided, 0.0021 two.sided, page 183

perm.test(ppdiff)
perm.test(ppdiff, alternative="less")
perm.test(ppdiff, exact=FALSE)




