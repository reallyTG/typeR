library(STAR)


### Name: acf.spikeTrain
### Title: Auto- Covariance and -Correlation Function Estimation for Spike
###   Train ISIs
### Aliases: acf.spikeTrain
### Keywords: ts

### ** Examples

## Simulate a log normal train
train1 <- c(cumsum(rlnorm(301,log(0.01),0.25)))
train1 <- as.spikeTrain(train1)
## Get its isi acf
acf.spikeTrain(train1,lag.max=100)



