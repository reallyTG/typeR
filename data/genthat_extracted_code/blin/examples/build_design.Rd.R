library(blin)


### Name: build_design
### Title: Build the BLIN design matrix
### Aliases: build_design
### Keywords: external

### ** Examples

S <- 5
L <- 4
tmax <- 10
data <- generate_blin(S,L,tmax, lag=2, sparse=.8, seed=1)
dim(data$Y)

Xreg <- build_design(data$Y, data$X, lag=2)
dim(Xreg)
class(Xreg)




