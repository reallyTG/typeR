library(spectral)


### Name: spec.lomb
### Title: Lomb-Scargle Periodigram
### Aliases: spec.lomb

### ** Examples

# create two sin-functions
x_orig <- seq(0,1,by=1e-2)
y_orig <- sin(10*2*pi*x_orig) + 0.3*sin(2*2*pi*x_orig)

# make a 10% gap
i <- round(length(x_orig)*0.2) : round(length(x_orig)*0.3)
x <- x_orig
y <- y_orig
x[i] <- NA
y[i] <- NA

# calculating the lomb periodogram
l <- spec.lomb(x = x, y = y)
# select a frequency range
m <- rbind(c(9,11))
# select and reconstruct the most significant component
l2 = filter.lomb(l, x_orig, filt=m)

# plot everything
par(mfrow=c(2,1),mar = c(4,4,2,4))
plot(x,y,"l", main = "Gapped signal")
lines(l2$x, l2$y,lty=2)
legend("bottomleft",c("gapped","10Hz component"),lty=c(1,2))

plot(l,main = "Spectrum")




