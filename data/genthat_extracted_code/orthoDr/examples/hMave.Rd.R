library(orthoDr)


### Name: hMave
### Title: Hazard Mave for Censored Survival Data
### Aliases: hMave

### ** Examples

# generate some survival data
set.seed(1)
P = 7
N = 150
dataX = matrix(runif(N*P), N, P)
failEDR = as.matrix(cbind(c(1, 1.3, -1.3, 1, -0.5, 0.5, -0.5, rep(0, P-7))))
T = exp(dataX %*% failEDR + rnorm(N))
C = runif(N, 0, 15)
Y = pmin(T, C)
Censor = (T < C)

# fit the model
hMave.fit = hMave(dataX, Y, Censor, 1)



