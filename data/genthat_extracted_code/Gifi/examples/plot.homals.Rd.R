library(Gifi)


### Name: plot.homals
### Title: Plot Methods for Homals
### Aliases: plot.homals
### Keywords: hplot

### ** Examples

fithart <- homals(hartigan, ndim = 3, normobj.z = FALSE)
fithart

plot(fithart)   
plot(fithart, var.subset = c(1,2,4), plot.dim = c(2,3))
plot(fithart, plot.type = "biplot", col.scores = "black")
plot(fithart, plot.type = "biplot", col.scores = "black", labels.scores = TRUE, col.points = 1:6)
plot(fithart, plot.type = "screeplot", col.lines = "red")
plot(fithart, plot.type = "transplot", plot.dim = 1:3, col.lines = c(1, 2, 4))
plot(fithart, plot.type = "transplot", stepvec = rep(FALSE, 6), max.plot.array = c(2,2))



