library(RobExtremes)


### Name: LDEstimate-class
### Title: LDEstimate-class.
### Aliases: LDEstimate-class dispersion dispersion,LDEstimate-method
###   location,LDEstimate-method show,LDEstimate-method
### Keywords: classes

### ** Examples

## (empirical) Data
x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2)

(S <- medQn(x, G))
dispersion(S)
location(S)



