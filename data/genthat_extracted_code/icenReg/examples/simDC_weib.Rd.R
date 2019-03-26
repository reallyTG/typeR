library(icenReg)


### Name: simDC_weib
### Title: Simulate Doubly Censored Data
### Aliases: simDC_weib

### ** Examples

simData <- simDC_weib()
fit <- ic_par(cbind(l, u) ~ x1 + x2, data = simData)



