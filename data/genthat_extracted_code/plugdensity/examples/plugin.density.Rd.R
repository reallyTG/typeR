library(plugdensity)


### Name: plugin.density
### Title: Kernel Density Estimation by Plug-In Bandwidth Selection
### Aliases: plugin.density print.densityEHpi
### Keywords: distribution smooth

### ** Examples

data(co2)
plot(dco2 <- density(co2), ylim = c(0, 0.03))
(pdco2 <- plugin.density(co2, xout = dco2$x))
lines(pdco2, col = "red")

plot(pdco2)# calls 'plot.density' method

str(pdco2 <- plugin.density(co2))
xo <- pdco2 $x
str(d.co2 <- density(co2, n = length(xo), from=xo[1],to=max(xo),
                     width= 4 * pdco2$bw))
nms <- c("x","y", "bw", "n")
all.equal(d.co2[nms], pdco2[nms])
## are close: "Component 2 (= 'y'): Mean relative difference: 0.0009..."



