library(ptw)


### Name: asysm
### Title: Trend estimation with asymmetric least squares
### Aliases: asysm
### Keywords: manip

### ** Examples

data(gaschrom)
plot(gaschrom[1,], type = "l", ylim = c(0, 100))
lines(asysm(gaschrom[1,]), col = 2)



