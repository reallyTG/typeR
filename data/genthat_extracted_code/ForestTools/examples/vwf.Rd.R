library(ForestTools)


### Name: vwf
### Title: Variable Window Filter
### Aliases: vwf

### ** Examples

# Set function for determining variable window radius
winFunction <- function(x){x * 0.06 + 0.5}

# Set minimum tree height (treetops below this height will not be detected)
minHgt <- 2

# Detect treetops in demo canopy height model
ttops <- vwf(CHMdemo, winFunction, minHgt)




