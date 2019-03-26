library(kitagawa)


### Name: cross_spectrum
### Title: Calculate the cross-spectrum of two timeseries
### Aliases: cross_spectrum cross_spectrum.mts cross_spectrum.default

### ** Examples

require(stats)

n <- 1000
ramp <- seq_len(n)
parab <- ramp^2

set.seed(1255)
X <- ts(rnorm(n) + ramp/2)
Y <- ts(rnorm(n) + ramp/10 + parab/100)

# Calculate the cross spectrum, multitaper if K is not NULL
csd <- cross_spectrum(X, Y, k=20)

with(csd,{
  x <- Frequency
  px <- c(x, rev(x))
  
  y1 <- y1s <- Coherence
  cpr <- attr(csd, 'mtcsd')[['Coh.probs']]
  sig99 <- max(cpr$coh.sig) # 99% confidence
  insig <- y1 < sig99
  y1s[insig] <- NA
  plot(x, y1, col=NA, main='Coherence')
  lines(x, y1, col='grey')
  lines(x, y1s)
  
  y2 <- y2s <- Admittance
  y2e <- 2*Admittance.stderr
  y2s[insig] <- NA
  py <- c(y2 + y2e, rev(y2 - y2e))
  plot(x, y2, col=NA, ylim=range(py), main='Admittance')
  polygon(px, py, col='lightgrey', border=NA)
  lines(x, y2, lty=3)
  lines(x, y2s)
  
  y3 <- y3s <- Phase * 180/pi
  y3s[insig] <- NA
  plot(x, y3, col=NA, ylim=90*c(-1,1), main='Phase')
  lines(x, y3, col='grey')
  lines(x, y3s)
})

# turn off k to get Welch's Overlapping
wcsd <- cross_spectrum(X, Y, k=NULL)




