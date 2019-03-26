library(parallelMCMCcombine)


### Name: semiparamDPE
### Title: Semiparametric Consensus Method
### Aliases: semiparamDPE
### Keywords: combine consensus subposterior posterior

### ** Examples
d      <- 2     # dimension of the parameter space  
sampT  <- 300   # number of subset posterior samples
M      <- 3     # total number of subsets

## simulate Gaussian subposterior samples

theta <- array(NA,c(d,sampT,M)) 

norm.mean <- c(1.0, 2.0)
norm.sd   <- c(0.5, 1.0)

for (i in 1:d)
  for (s in 1:M)        
    theta[i,,s] <- rnorm(sampT, mean=norm.mean[i]+runif(1,-0.01,0.01), sd=norm.sd[i])

## estimate (mean) standard deviations for each parameter across the subsets

norm.var.est <- rep(0,d)

for(i in 1:d)
  for(s in 1:M)
    norm.var.est[i] <- norm.var.est[i] + var(theta[i,,s])

norm.sd.est <- sqrt(norm.var.est/M)


## Compute the diagonal of the optimal bandwidth
## matrix according to Silverman's rule 

h_opt1 = (4/(d+2))^(1/(4+d)) * (sampT^(-1/(4+d))) * norm.sd.est

## Combine samples. The bandwidth matrix is fixed:

full.theta1 <- semiparamDPE( subchain = theta, bandw = h_opt1 * 2, anneal = FALSE)

## Compute the diagonal of the optimal bandwidth 
## matrix for the method that uses annealing

h_opt2 = (4/(d+2))^(1/(4+d)) * norm.sd.est

## Combine samples. The bandwidth matrix will be annealed:

full.theta2 <- semiparamDPE(subchain = theta, bandw = h_opt2 * 2, anneal = TRUE)



