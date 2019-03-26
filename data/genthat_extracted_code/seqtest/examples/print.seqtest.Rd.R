library(seqtest)


### Name: print.seqtest
### Title: Print seqtest
### Aliases: print.seqtest

### ** Examples


#--------------------------------------
# Sequential triangular test for the arithmetic mean in one sample

seq.obj <- seqtest.mean(56, mu = 50, theta = 0.5,
                        alpha = 0.05, beta = 0.2, output = FALSE)

print(seq.obj)

#--------------------------------------
# Sequential triangular test for the proportion in one sample

seq.obj <- seqtest.prop(c(1, 1, 0, 1), pi = 0.5, delta = 0.2,
                        alpha = 0.05, beta = 0.2, output = FALSE)

print(seq.obj)

#--------------------------------------
# Sequential triangular test for Pearson's correlation coefficient

seq.obj <- seqtest.cor(0.46, k = 14, rho = 0.3, delta = 0.2,
                       alpha = 0.05, beta = 0.2, output = FALSE)

print(seq.obj)



