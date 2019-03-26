library(parallelMCMCcombine)


### Name: sampleAvg
### Title: Sample Averaging Method
### Aliases: sampleAvg
### Keywords: combine consensus subposterior posterior parallel

### ** Examples
d      <- 2     # dimension of the parameter space  
sampT  <- 1000  # number of subset posterior samples
M      <- 3     # total number of subsets

## simulate Gaussian subposterior samples

theta <- array(NA,c(d,sampT,M)) 

norm.mean <- c(1.0, 2.0)
norm.sd   <- c(0.5, 1.0)

for (i in 1:d)
  for (s in 1:M)        
    theta[i,,s] <- rnorm(sampT, mean=norm.mean[i]+runif(1,-0.01,0.01), sd=norm.sd[i])

## combine samples:

full.theta <- sampleAvg(subchain=theta, shuff=FALSE)



