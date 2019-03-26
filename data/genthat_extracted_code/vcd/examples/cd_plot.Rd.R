library(vcd)


### Name: cd_plot
### Title: Conditional Density Plots
### Aliases: cd_plot cd_plot.default cd_plot.formula
### Keywords: hplot

### ** Examples

## Arthritis data
data("Arthritis")
cd_plot(Improved ~ Age, data = Arthritis)
cd_plot(Improved ~ Age, data = Arthritis, bw = 3)
cd_plot(Improved ~ Age, data = Arthritis, bw = "SJ")
## compare with spinogram
spine(Improved ~ Age, data = Arthritis, breaks = 3)

## Space shuttle data
data("SpaceShuttle")
cd_plot(Fail ~ Temperature, data = SpaceShuttle, bw = 2)

## scatter plot with conditional density
cdens <- cd_plot(Fail ~ Temperature, data = SpaceShuttle, bw = 2, plot = FALSE)
plot(I(-1 * (as.numeric(Fail) - 2)) ~ jitter(Temperature, factor = 2), data = SpaceShuttle,
  xlab = "Temperature", ylab = "Failure")
lines(53:81, cdens[[1]](53:81), col = 2)



