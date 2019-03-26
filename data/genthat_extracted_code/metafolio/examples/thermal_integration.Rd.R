library(metafolio)


### Name: thermal_integration
### Title: Integrate thermal tolerance curves to get maximum Ricker a
###   values
### Aliases: thermal_integration

### ** Examples

# Minimal example:
thermal_integration(16)

# Elaborate example:
optim_temps <- seq(13, 19, length.out = 10)
widths <- c(seq(0.05, 0.02, length.out = 5), rev(seq(0.05, 0.02,
      length.out = 5)))
heights <- c(seq(2.8, 2.2, length.out = 5), rev(seq(2.8, 2.2,
      length.out = 5)))
x <- seq(3, 29, length.out = 200)
plot(1, 1, xlim = c(4, 28), ylim = c(-0.01, 2.9), ylab = "Ricker
  productivity parameter (a)", xlab = "Environmental value", type =
  "n", yaxs = "i", las = 1)
for(i in 1:10) {
  a <- thermal_curve_a(x, optim_temp = optim_temps[i], max_a =
    heights[i], width_param = widths[i])
  lines(x, a, col = "grey40", lwd = 1.5)
}



