library(wavethresh)


### Name: denwd
### Title: Wavelet decomposition of empirical scaling function coefficients
###   of a p.d.f.
### Aliases: denwd
### Keywords: smooth

### ** Examples

# Simulate data from the claw density, find the empirical
# scaling function coefficients, decompose them and plot
# the resulting wavelet coefficients
 
data <- rclaw(100)
datahr <- denproj(data, J=8, filter.number=2,family="DaubExPhase")
data.wd <- denwd(datahr)
## Not run: plotdenwd(data.wd, top.level=(datahr$res$J-1))



