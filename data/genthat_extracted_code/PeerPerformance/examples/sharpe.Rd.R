library(PeerPerformance)


### Name: sharpe
### Title: Compute Sharpe ratio
### Aliases: sharpe
### Keywords: htest

### ** Examples

## Load the data
data('hfdata')

## Compute the Sharpe ratio
out = sharpe(hfdata)
print(out)

out = sharpe(hfdata, na.rm = FALSE)
print(out)



