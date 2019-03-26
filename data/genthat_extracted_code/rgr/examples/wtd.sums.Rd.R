library(rgr)


### Name: wtd.sums
### Title: Function to Compute Weighted Sums
### Aliases: wtd.sums
### Keywords: multivariate

### ** Examples

##  Make test data available
data(sind)
attach(sind)

##  Compute weighted sums as in Garrett & Grunsky (2001)
##  using medians and interquartile SDs
sind.ws.geea <- wtd.sums(cbind(Zn, Cd, Fe, Mn), ri = c(2, 1, -1, -1),
	xloc = c(48, 0.6, 1.74, 590), 
	xspread = c(41.5128, 0.44478, 0.882147, 333.585))

## Compute weighted sums using the median and MAD defaults
sind.ws.def <- wtd.sums(cbind(Zn, Cd, Fe, Mn), ri = c(2, 1, -1, -1))

## Plot the two results against one-another, adding a constant,
## 3, to the weighted sums to make them positive and log-scale
## plottable
par(pty="s")
plot(sind.ws.geea$ws+3, sind.ws.def$ws+3, log = "xy", 
	xlim = c(2, 28), ylim = c(2, 28))
abline(0, 1, lty = 3)
abline(v =3, lty = 3)
abline(h = 3, lty = 3)

## Inspect the default weighted sums, adding a constant, 3, to the
## weighted sums to make them positive and log-scale plottable
shape(sind.ws.def$ws+3, log = TRUE)

## Plot EDA Tukey boxplot based map of default weighted sums
map.eda7(E, N, sind.ws.def$ws)

## Clean-up and detach test data
rm(sind.ws.geea)
rm(sind.ws.def)
par(pty = "m")
detach(sind)



