library(ptw)


### Name: baseline.corr
### Title: Baseline Correction using asymmetric least squares
### Aliases: baseline.corr
### Keywords: manip

### ** Examples

data(gaschrom)
plot(gaschrom[1,], type = "l", ylim = c(0, 100))
lines(baseline.corr(gaschrom[1,]), col = 2)



