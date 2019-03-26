library(miscor)


### Name: print.seqtest
### Title: Print seqtest
### Aliases: print.seqtest

### ** Examples

#--------------------------------------
# Sequential triangular test for product-moment correlation coefficient

seq.obj <- seqtest.cor(0.46, k = 14, rho = 0.3, delta = 0.2,
                       alpha = 0.05, beta = 0.2, output = FALSE)

print(seq.obj)



