library(Bolstad)


### Name: xdesign
### Title: Monte Carlo study of randomized and blocked designs
### Aliases: xdesign
### Keywords: misc

### ** Examples


# Carry out simulations using the default parameters 

xdesign()

# Carry out simulations using a simulated response with 5 treaments, 
# groups of size 25, and a correlation of -0.6 between the response 
# and lurking variable

xdesign(corr = -0.6, size = 25, n.treatments = 5)




