library(wavethresh)


### Name: plotdenwd
### Title: Plot the wavelet coefficients of a p.d.f.
### Aliases: plotdenwd
### Keywords: hplot

### ** Examples

# Simulate data from the claw density, find the empirical
# scaling function coefficients, decompose them and plot
# the resulting wavelet coefficients

data <- rclaw(100)
datahr <- denproj(data, J=8, filter.number=2, family="DaubExPhase")
data.wd <- denwd(datahr)
## Not run: plotdenwd(data.wd, top.level=(datahr$res$J-1))
#
# Now use a smoother wavelet
#
datahr <- denproj(data, J=8, filter.number=10, family="DaubLeAsymm")
data.wd <- denwd(datahr)
## Not run: plotdenwd(data.wd, top.level=(datahr$res$J-1))



