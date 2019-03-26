library(varian)


### Name: vmp_plot
### Title: Plot the posterior distributions of the focal parameters from a
###   VM model
### Aliases: vmp_plot
### Keywords: hplot

### ** Examples

# Using made up data because the real models take a long time to run
set.seed(1234) # make reproducible
vmp_plot(matrix(rnorm(1000), ncol = 2))



