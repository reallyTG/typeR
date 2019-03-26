library(seqtest)


### Name: seqtest.mean
### Title: Sequential triangular test for the arithmetic mean
### Aliases: seqtest.mean

### ** Examples


#--------------------------------------
# Two-sided one-sample test
# H0: mu = 50, H1: mu != 50
# alpha = 0.05, beta = 0.2, theta = 0.5

seq.obj <- seqtest.mean(56, mu = 50, theta = 0.5,
                        alpha = 0.05, beta = 0.2, plot = TRUE)

# alternative specifiation using sigma and delta
seq.obj <- seqtest.mean(56, mu = 50, sigma = 10, delta = 5,
                        alpha = 0.05, beta = 0.2, plot = TRUE)

seq.obj <- update(seq.obj, x = c(54, 52, 46, 49))
seq.obj <- update(seq.obj, x = c(46, 49, 51, 45))
seq.obj <- update(seq.obj, x = c(51, 42, 50, 53))
seq.obj <- update(seq.obj, x = c(50, 53, 49, 53))

#--------------------------------------
# One-sided one-sample test
# H0: mu <= 50, H1: mu > 50
# alpha = 0.05, beta = 0.2, theta = 0.5

seq.obj <- seqtest.mean(c(56, 53), mu = 50, alternative = "greater",
                        theta = 0.5, alpha = 0.05, beta = 0.2, plot = TRUE)

# alternative specifiation using sigma and delta
seq.obj <- seqtest.mean(c(56, 53), mu = 50, alternative = "greater",
                        sigma = 10, delta = 5, alpha = 0.05, beta = 0.2, plot = TRUE)

seq.obj <- update(seq.obj, x = c(67, 52, 48, 59))
seq.obj <- update(seq.obj, x = c(53, 57, 54, 62))
seq.obj <- update(seq.obj, x = 58)

#--------------------------------------
# Two-sided two-sample test
# H0: mu.1 = mu.2, H1: mu.1 != mu.2
# alpha = 0.01, beta = 0.1, theta = 1

seq.obj <- seqtest.mean(53, 45, theta = 1,
                        alpha = 0.01, beta = 0.01, plot = TRUE)

# alternative specifiation using sigma and delta
seq.obj <- seqtest.mean(57, 45, sigma = 10, delta = 10,
                        alpha = 0.01, beta = 0.01, plot = TRUE)

seq.obj <- update(seq.obj, x = c(58, 54, 56), y = c(45, 41, 42))
seq.obj <- update(seq.obj, x = c(56, 50, 49), y = c(42, 45, 50))
seq.obj <- update(seq.obj, x = c(62, 57, 59))
seq.obj <- update(seq.obj, y = c(41, 39, 46))
seq.obj <- update(seq.obj, x = 67)
seq.obj <- update(seq.obj, y = 40)
seq.obj <- update(seq.obj, y = 36)

#--------------------------------------
# One-sided two-sample test
# H0: mu.1 <= mu.2, H1: mu.1 > mu.2
# alpha = 0.01, beta = 0.1, theta = 1

seq.obj <- seqtest.mean(53, 45, alternative = "greater", theta = 1,
                        alpha = 0.01, beta = 0.01, plot = TRUE)

# alternative specifiation using sigma and delta
seq.obj <- seqtest.mean(57, 45, alternative = "greater",sigma = 10, delta = 10,
                        alpha = 0.01, beta = 0.01, plot = TRUE)

seq.obj <- update(seq.obj, x = c(58, 54, 56), y = c(45, 41, 42))
seq.obj <- update(seq.obj, x = c(56, 50, 49), y = c(42, 45, 50))
seq.obj <- update(seq.obj, x = c(62, 57, 59))
seq.obj <- update(seq.obj, y = c(41, 39, 46))



