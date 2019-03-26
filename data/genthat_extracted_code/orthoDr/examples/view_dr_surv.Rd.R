library(orthoDr)


### Name: view_dr_surv
### Title: 2D or 2D view of survival data on reduced dimension
### Aliases: view_dr_surv

### ** Examples

# generate some survival data
N = 100; P = 4; dataX = matrix(rnorm(N*P), N, P)
Y = exp(-1 + dataX[,1] + rnorm(N))
Censor = rbinom(N, 1, 0.8)

orthoDr.fit = orthoDr_surv(dataX, Y, Censor, ndr = 1, method = "dm")
view_dr_surv(dataX, Y, Censor, orthoDr.fit$B)



