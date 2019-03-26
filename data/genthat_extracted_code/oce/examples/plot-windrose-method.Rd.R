library(oce)


### Name: plot,windrose-method
### Title: Plot Windrose data
### Aliases: plot,windrose-method plot.windrose

### ** Examples

library(oce)
opar <- par(no.readonly = TRUE)
xcomp <- rnorm(360) + 1
ycomp <- rnorm(360)
wr <- as.windrose(xcomp, ycomp)
par(mfrow=c(1, 2))
plot(wr)
plot(wr, "fivenum")
par(opar)




