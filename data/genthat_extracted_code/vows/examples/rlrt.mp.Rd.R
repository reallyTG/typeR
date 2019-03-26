library(vows)


### Name: rlrt.mp
### Title: Massively parallel restricted likelihood ratio tests
### Aliases: rlrt.mp

### ** Examples


Y = matrix(rnorm(6000), nrow=20)
x = rnorm(20)
t4 = rlrt.mp(Y, x, loginvsp = -22:0)
f4 = Fdr.rlrt(t4, 6)



