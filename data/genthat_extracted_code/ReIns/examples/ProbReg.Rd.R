library(ReIns)


### Name: ProbReg
### Title: Estimator of small tail probability in regression
### Aliases: ProbReg

### ** Examples

data(norwegianfire)

Z <- norwegianfire$size[norwegianfire$year==76]

i <- 100
n <- length(Z)

# Scale estimator in i/n
A <- ScaleReg(i/n, Z, h=0.5, kernel = "epanechnikov")$A

# Small exceedance probability
q <- 10^6
ProbReg(Z, A, q, plot=TRUE)

# Large quantile
p <- 10^(-5)
QuantReg(Z, A, p, plot=TRUE)



