library(PeerPerformance)


### Name: msharpe
### Title: Compute modified Sharpe ratio
### Aliases: msharpe
### Keywords: htest

### ** Examples

## Load the data (randomized data of monthly hedge fund returns)
data('hfdata')

out = msharpe(hfdata)
print(out)

out = msharpe(hfdata, na.rm = FALSE)
print(out)



