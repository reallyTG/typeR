library(soundgen)


### Name: estimateVTL
### Title: Estimate vocal tract length
### Aliases: estimateVTL

### ** Examples

estimateVTL(NA)
estimateVTL(500)
estimateVTL(c(600, 1850, 3100))
estimateVTL(formants = list(f1 = 600, f2 = 1650, f3 = 2400))

# for moving formants, frequencies are averaged over time,
# i.e. this is identical to the previous example
estimateVTL(formants = list(f1 = c(500, 700), f2 = 1650, f3 = c(2200, 2600)))



