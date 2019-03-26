library(qpcR)


### Name: pcrboot
### Title: Bootstrapping and jackknifing qPCR data
### Aliases: pcrboot
### Keywords: models nonlinear

### ** Examples

## Simple bootstrapping with
## too less iterations...
par(ask = FALSE)
m1 <- pcrfit(reps, 1, 2, l4)
pcrboot(m1, B = 20)

## Jackknifing with leaving
## 5 datapoints out.
m2 <- pcrfit(reps, 1, 2, l4)
pcrboot(m2, type = "jack", njack = 5, B = 20)



