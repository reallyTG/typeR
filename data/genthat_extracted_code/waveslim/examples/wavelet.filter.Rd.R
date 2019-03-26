library(waveslim)


### Name: wavelet.filter
### Title: Higher-Order Wavelet Filters
### Aliases: wavelet.filter
### Keywords: ts

### ** Examples

## Figure 4.14 in Gencay, Selcuk and Whitcher (2001)
par(mfrow=c(3,1), mar=c(5-2,4,4-1,2))
f.seq <- "HLLLLL"
plot(c(rep(0,33), wavelet.filter("mb4", f.seq), rep(0,33)), type="l",
     xlab="", ylab="", main="D(4) in black, MB(4) in red")
lines(c(rep(0,33), wavelet.filter("d4", f.seq), rep(0,33)), col=2)
plot(c(rep(0,35), -wavelet.filter("mb8", f.seq), rep(0,35)), type="l",
     xlab="", ylab="", main="D(8) in black, -MB(8) in red")
lines(c(rep(0,35), wavelet.filter("d8", f.seq), rep(0,35)), col=2)
plot(c(rep(0,39), wavelet.filter("mb16", f.seq), rep(0,39)), type="l",
     xlab="", ylab="", main="D(16) in black, MB(16) in red")
lines(c(rep(0,39), wavelet.filter("d16", f.seq), rep(0,39)), col=2)



