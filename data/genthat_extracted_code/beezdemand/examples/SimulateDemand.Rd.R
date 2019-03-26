library(beezdemand)


### Name: SimulateDemand
### Title: Simulate Demand Data
### Aliases: SimulateDemand

### ** Examples

## set values
setparams <- vector(length = 4)
setparams <- c(-2.5547, .702521, 1.239893, .320221, 3.096, 1.438231)
names(setparams) <- c("alphalm", "alphalsd", "q0lm", "q0lsd", "k", "yvalssd")
sdindex <- c(2.1978, 1.9243, 1.5804, 1.2465, 0.8104, 0.1751, 0.0380, 0.0270)
x <- c(.1, 1, 3, 10, 30, 100, 300, 1000)
set.seed(1234)
sim <- SimulateDemand(nruns = 1, setparams = setparams, sdindex = sdindex, x = x)
sim



