library(shinyrecap)


### Name: simulateCapture
### Title: Simulate Capture Re-capture with heterogeneity
### Aliases: simulateCapture

### ** Examples

het <- simulateHeteroNormal(1000, 1.1)
cap <- simulateCapture(het, p = c(.05,.1,.05,.1))
summary(cap)



