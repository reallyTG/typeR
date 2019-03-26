library(prevalence)


### Name: betaPERT
### Title: Calculate the parameters of a Beta-PERT distribution
### Aliases: betaPERT print.betaPERT plot.betaPERT
### Keywords: Expert PERT

### ** Examples

## The value of a parameter of interest is believed to lie between 0 and 50
## The most likely value is believed to be 10

# Classical PERT
betaPERT(a = 0, m = 10, b = 50, method = "classic")

# Vose parametrization
betaPERT(a = 0, m = 10, b = 50, method = "vose")



