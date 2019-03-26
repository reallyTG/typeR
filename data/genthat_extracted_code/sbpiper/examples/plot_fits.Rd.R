library(sbpiper)


### Name: plot_fits
### Title: Plot the number of iterations vs objective values in log10
###   scale.
### Aliases: plot_fits

### ** Examples

v <- 10*(rnorm(10000))^4 + 10
plot_fits(objval.vec=v) + basic_theme(36)



