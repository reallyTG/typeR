library(RobPer)


### Name: tsgen
### Title: Artificial light curve generator
### Aliases: tsgen

### ** Examples

# Generate a light curve:
set.seed(22)
lightcurve<- tsgen(ttype="sine", ytype="peak" , pf=7, redpart=0.1, s.outlier.fraction=0, 
    interval=FALSE, npoints=200, ncycles=100, ps=5, SNR=3, alpha=0)

# Or do it step by step:
# First sampling observation times:
set.seed(22)
tt <- sampler(ttype="sine", npoints=200, ncycles=100, ps=5)

# show obviously irregular observation times as grey vertical bars on a red time line:
plot(tt, tt*0, type="n", axes=FALSE, xlab="Observation Times", ylab="")
    abline(v=tt, col="grey")
axis(1, pos=0, col="red", col.axis="red")

# Sampling period is 5, look at observation times modulo 10:
hist(tt%%5, xlab="Observation time modulo 5", 
    main="Sine Distribution for the phase (tt modulo 5)", freq=FALSE)
dsin <- function(tt) 0.2*(sin(2*pi*tt/5)+1)
curve(dsin, add=TRUE)

# Then generate periodic fluctuation
yf <- signalgen(tt, ytype="peak", pf=7)

plot(tt, yf, xlab="Observation Times", ylab="Periodic Fluctuation")
plot(tt%%7, yf, main="Phase Diagram (time modulo 7)", 
    xlab="Observation time modulo 7",  ylab="Periodic Fluctuation")

# Add noise and scale signal to the right SNR
temp <- lc_noise(tt,sig=yf, SNR=3, redpart=0.1, alpha=0)
y <- temp$y
s <- temp$s

# Plotting the light curve (vertical bars show measurement accuracies)
plot(tt, y, pch=16, cex=0.5, xlab="t", ylab="y", main="a Light Curve")
rect(tt, y+s, tt, y-s)

# The lightcurve has period 7:
plot(tt%%7, y, pch=16, cex=0.5, xlab="t", ylab="y", 
    main="Phase Diagram of a Light Curve")
rect(tt%%7, y+s, tt%%7, y-s)

# replace measurement accuracies by tiny outliers or include a peak
temp <- disturber(tt,y,s,ps=5, s.outlier.fraction=0, interval=FALSE)

# Phase diagram (observation times modulo 10)
plot(tt%%7, temp$y, pch=16, cex=0.5, xlab="t", ylab="y", 
    main="Phase Diagram of a Light Curve")
rect(tt%%7, temp$y+temp$s, tt%%7, temp$y-temp$s)

# The result is the same:
all(cbind(tt,temp$y,temp$s)==lightcurve)



