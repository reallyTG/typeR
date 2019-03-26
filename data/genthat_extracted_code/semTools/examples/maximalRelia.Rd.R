library(semTools)


### Name: maximalRelia
### Title: Calculate maximal reliability
### Aliases: maximalRelia

### ** Examples


total <- 'f =~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 '
fit <- cfa(total, data = HolzingerSwineford1939)
maximalRelia(fit)

# Extract the weight
mr <- maximalRelia(fit)
attr(mr, "weight")




