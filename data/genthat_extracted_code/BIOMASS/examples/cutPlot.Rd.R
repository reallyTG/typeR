library(BIOMASS)


### Name: cutPlot
### Title: Divides a plot in subplots
### Aliases: cutPlot

### ** Examples


coord <- data.frame(X = c(0, 200, 0, 200), Y = c(0, 0, 200, 200)) + 5000
corner <- c(1, 2, 4, 3)
plot <- rep("plot1", 4)

cut <- cutPlot(coord, plot, corner, gridsize = 100, dimX = 200, dimY = 200)

# plot the result
plot(coord, main = "example", xlim = c(4900, 5300), ylim = c(4900, 5300), asp = 1)
text(coord, labels = corner, pos = 1)
points(cut$XAbs, cut$YAbs, pch = "+")
legend("bottomright", legend = c("orignal", "cut"), pch = c("o", "+"))



