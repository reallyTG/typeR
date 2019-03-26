library(seqtest)


### Name: seqtest.prop
### Title: Sequential triangular test for the proportion
### Aliases: seqtest.prop

### ** Examples


#--------------------------------------
# Two-sided one-sample test
# H0: pi = 0.5, H1: pi != 0.5
# alpha = 0.05, beta = 0.2, delta = 0.2

seq.obj <- seqtest.prop(c(1, 1, 0, 1), pi = 0.5, delta = 0.2,
                        alpha = 0.05, beta = 0.2, plot = TRUE)

seq.obj <- update(seq.obj, x = c(1, 1, 1, 1, 1, 0, 1, 1, 1))
seq.obj <- update(seq.obj, x = c(0, 1, 1, 1))
seq.obj <- update(seq.obj, x = c(1, 1))

#--------------------------------------
# One-sided one-sample test
# H0: pi <= 0.5, H1: pi > 0.5
# alpha = 0.05, beta = 0.2, delta = 0.2

seq.obj <- seqtest.prop(c(1, 1, 0, 1), pi = 0.5,
                        alternative = "greater", delta = 0.2,
                        alpha = 0.05, beta = 0.2, plot = TRUE)

seq.obj <- update(seq.obj, x = c(1, 1, 1, 1, 1, 0, 1, 1, 1))
seq.obj <- update(seq.obj, x = c(0, 1, 1, 1))

#--------------------------------------
# Two-sided two-sample test
# H0: pi.1 = pi.2 = 0.5, H1: pi.1 != pi.2
# alpha = 0.01, beta = 0.1, delta = 0.2

seq.obj <- seqtest.prop(1, 0, pi = 0.5, delta = 0.2,
                        alpha = 0.01, beta = 0.1, plot = TRUE)

seq.obj <- update(seq.obj, x = c(1, 1, 1, 0), y = c(0, 0, 1, 0))
seq.obj <- update(seq.obj, x = c(0, 1, 1, 1), y = c(0, 0, 0, 0))
seq.obj <- update(seq.obj, x = c(1, 0, 1, 1), y = c(0, 0, 0, 1))
seq.obj <- update(seq.obj, x = c(1, 1, 1, 1), y = c(0, 0, 0, 0))
seq.obj <- update(seq.obj, x = c(0, 1, 0, 1))
seq.obj <- update(seq.obj, y = c(0, 0, 0, 1))
seq.obj <- update(seq.obj, x = c(1, 1, 1, 1))

#--------------------------------------
# One-sided two-sample test
# H0: pi.1 <=  pi.1 = 0.5, H1: pi.1 > pi.2
# alpha = 0.01, beta = 0.1, delta = 0.2

seq.obj <- seqtest.prop(1, 0, pi = 0.5, delta = 0.2,
                        alternative = "greater",
                        alpha = 0.01, beta = 0.1, plot = TRUE)

seq.obj <- update(seq.obj, x = c(1, 1, 1, 0), y = c(0, 0, 1, 0))
seq.obj <- update(seq.obj, x = c(0, 1, 1, 1), y = c(0, 0, 0, 0))
seq.obj <- update(seq.obj, x = c(1, 0, 1, 1), y = c(0, 0, 0, 1))
seq.obj <- update(seq.obj, x = c(1, 1, 1), y = c(0, 0))



