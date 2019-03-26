library(wmtsa)


### Name: holderSpectrum
### Title: The Holder spectrum of a time series
### Aliases: holderSpectrum
### Keywords: univar models nonlinear

### ** Examples

## create series with a linear trend and two 
## cusps: h(x = 1) = 0.5 and h(x = 15) = 0.3 
cusps <- function(x) -0.2 * abs(x-1)^0.5 - 0.5* abs(x-15)^0.3 + 0.00346 * x + 1.34
x <- seq(-5, 20, length=1000)
y <- splus2R::signalSeries(cusps(x), x)

## calculate CWT using Mexican hat filter 
W <- wavCWT(y, wavelet="gaussian2")

## calculate WTMM and extract first two branches 
## in tree corresponding to the cusps 
W.tree <- wavCWTTree(W)[1:2]

## plot the CWT tree overlaid with a scaled 
## version of the time series to illustrate 
## alignment of branches with cusps 
yshift <- y@data - min(y@data)
yshift <- yshift / max(yshift) * 4 - 4.5
plot(W.tree, xlab="x")
lines(x, yshift, lwd=2)
text(6.5, -1, "f(x) = -0.2|x-1|^0.5 - 0.5|x-15|^0.3 + 0.00346x + 1.34", cex=0.8)

## estimate Holder exponents 
holder <- holderSpectrum(W.tree)
print(holder)



