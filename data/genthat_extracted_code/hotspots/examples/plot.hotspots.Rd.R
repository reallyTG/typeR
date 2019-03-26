library(hotspots)


### Name: plot.hotspots
### Title: Plotting hot spot and outlier cutoffs
### Aliases: plot.hotspots

### ** Examples

#both tails on skewed data
rln100pn <- hotspots(c(rlnorm(50),rlnorm(50)*-1),tail = "both")
plot(rln100pn)

#modify graphical parameters
plot(rln100pn, pch = 16, cex = 1.5)



