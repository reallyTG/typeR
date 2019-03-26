library(vows)


### Name: rlrt.mp.fit
### Title: Massively parallel restricted likelihood ratio tests (internal)
### Aliases: rlrt.mp.fit

### ** Examples


Y = matrix(rnorm(6000), nrow=20)
x = rnorm(20)
z = rep(1:5, each = 4)
t4. = rlrt.mp.fit(Y, x, z, loginvsp = -22:0)



