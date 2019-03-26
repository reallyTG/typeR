library(seqtest)


### Name: seqtest.cor
### Title: Sequential triangular test for Pearson's correlation coefficient
### Aliases: seqtest.cor

### ** Examples


#--------------------------------------
# H0: rho = 0.3, H1: rho != 0.3
# alpha = 0.05, beta = 0.2, delta = 0.2

seq.obj <- seqtest.cor(0.46, k = 14, rho = 0.3, delta = 0.2,
                       alpha = 0.05, beta = 0.2, plot = TRUE)

seq.obj <- update(seq.obj, c(0.56, 0.76, 0.56, 0.52))

#--------------------------------------
# H0: rho <= 0.3, H1: rho > 0.3
# alpha = 0.05, beta = 0.2, delta = 0.2

seq.obj <- seqtest.cor(0.46, k = 14, rho = 0.3,
                       alternative = "greater", delta = 0.2,
                       alpha = 0.05, beta = 0.2, plot = TRUE)

seq.obj <- update(seq.obj, c(0.56, 0.76, 0.66))



