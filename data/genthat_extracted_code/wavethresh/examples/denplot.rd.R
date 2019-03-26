library(wavethresh)


### Name: denplot
### Title: Calculate plotting information for a density estimate.
### Aliases: denplot
### Keywords: smooth

### ** Examples

# Simulate data from the claw density and find the 
# empirical scaling function coefficients at a lowish resolution and plot
# the resulting density estimate
data <- rclaw(100)
datahr <- denproj(data, J=3, filter.number=2,family="DaubExPhase")
datapl <- denplot(datahr$coef, datahr, lims=c(-3,3), n=1000)
## Not run: plot(datapl, type="l")



