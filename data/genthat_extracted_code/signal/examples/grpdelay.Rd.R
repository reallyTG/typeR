library(signal)


### Name: grpdelay
### Title: Group delay of a filter or model
### Aliases: grpdelay grpdelay.default grpdelay.Arma grpdelay.Ma
###   grpdelay.Zpg plot.grpdelay print.grpdelay
### Keywords: math

### ** Examples

# Two Zeros and Two Poles
b <- poly(c(1/0.9*exp(1i*pi*0.2), 0.9*exp(1i*pi*0.6)))
a <- poly(c(0.9*exp(-1i*pi*0.6), 1/0.9*exp(-1i*pi*0.2)))
gpd <- grpdelay(b, a, 512, whole = TRUE, Fs = 1)
print(gpd)
plot(gpd)



