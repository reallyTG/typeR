library(logcondens.mode)


### Name: logcondens.mode-package
### Title: Computation of Log-Concave Densities on R with fixed mode and
###   Inference for the Mode.
### Aliases: logcondens.mode-package logcondens.mode
### Keywords: package htest nonparametric

### ** Examples



nn <- 200
myxx <- rnorm(nn) ## no need to sort
TRUEMODE <- 0

res.MC <- activeSetLogCon.mode(myxx, mode=TRUEMODE)
LRmodeTest(mode=TRUEMODE, x=myxx, xgrid=.05, alpha=.05)
CI <- LCLRCImode(x=myxx, alpha=0.05)
print(CI[1] <= TRUEMODE && TRUEMODE <= CI[2]) ## approx 95% coverage probability






