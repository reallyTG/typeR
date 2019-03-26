library(exuber)


### Name: sim_div
### Title: Simulation of dividends
### Aliases: sim_div

### ** Examples

# Price is the sum of the bubble and fundamental components
# 20 is the scaling factor
pf <- sim_div(100, r = 0.05, output = "pf")
pb <- sim_evans(100, r = 0.05)
p <- pf + 20*pb



