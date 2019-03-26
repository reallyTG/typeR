library(redR)


### Name: degrade
### Title: Degradation of an image
### Aliases: degrade

### ** Examples

degraded.lenna <- degrade(lenna, L = 4, noise = 0.05, blur = 3)
par(mfrow = c(1,2), mar = c(0,0,1,0)+0.1)
plot(lenna, axes = FALSE, interp = FALSE, main = 'Original Lenna')
plot(degraded.lenna, axes = FALSE, interp = FALSE, main = 'Degraded Lenna')



