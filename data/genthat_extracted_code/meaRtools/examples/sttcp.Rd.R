library(meaRtools)


### Name: sttcp
### Title: Compute
### Aliases: sttcp

### ** Examples

t1 <- -cumsum(log(runif(1000)) / 2)
t2 <- -cumsum(log(runif(1000)) / 2)
corr <- sttcp(t1, t2)
plot(corr, main="cross correlation")
autocorr <- sttcp(t1, t1)
plot(autocorr, main="auto correlation")



