library(miscor)


### Name: update.seqtest
### Title: Update seqtest
### Aliases: update.seqtest

### ** Examples

#--------------------------------------
# Sequential triangular test for the product-moment correlation coefficient

seq.obj <- seqtest.cor(0.46, k = 14, rho = 0.3, delta = 0.2,
                       alpha = 0.05, beta = 0.2, plot = TRUE)

seq.obj <- update(seq.obj, c(0.56, 0.76, 0.56, 0.52))



