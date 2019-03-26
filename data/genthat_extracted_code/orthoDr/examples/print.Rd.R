library(orthoDr)


### Name: print
### Title: print.orthoDr
### Aliases: print print.orthoDr
### Keywords: internal

### ** Examples

# generate some survival data
N = 100; P = 4; dataX = matrix(rnorm(N*P), N, P)
Y = exp(-1 + dataX[,1] + rnorm(N))
Censor = rbinom(N, 1, 0.8)
# fit the model
orthoDr_surv(dataX, Y, Censor, ndr = 1, method = "dm")



