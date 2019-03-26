library(wavethresh)


### Name: denproj
### Title: Calculate empirical scaling function coefficients of a p.d.f.
### Aliases: denproj
### Keywords: smooth

### ** Examples

# Simulate data from the claw density and find the 
# empirical scaling function coefficients
data <- rclaw(100)
datahr <- denproj(data, J=8, filter.number=4,family="DaubLeAsymm")



