library(orthoDr)


### Name: predict
### Title: predict.orthoDr
### Aliases: predict predict.orthoDr

### ** Examples

# generate some survival data
N = 100; P = 4; dataX = matrix(rnorm(N*P), N, P)
Y = exp(-1 + dataX[,1] + rnorm(N))
Censor = rbinom(N, 1, 0.8)

# fit the model with keep.data = TRUE
orthoDr.fit = orthoDr_surv(dataX, Y, Censor, ndr = 1, method = "dm", keep.data = TRUE)

#predict 10 new observations
predict(orthoDr.fit, matrix(rnorm(10*P), 10, P))



