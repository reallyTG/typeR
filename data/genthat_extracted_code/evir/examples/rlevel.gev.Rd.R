library(evir)


### Name: rlevel.gev
### Title: Calculate Return Levels Based on GEV Fit
### Aliases: rlevel.gev
### Keywords: htest

### ** Examples

data(bmw)
out <- gev(bmw, "month")
# Fit GEV to monthly maxima of daily returns on BMW share price
## Not run: rlevel.gev(out, 40)
# Calculate the 40 month return level



