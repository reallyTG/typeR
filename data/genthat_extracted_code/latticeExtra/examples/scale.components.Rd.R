library(latticeExtra)


### Name: scale.components
### Title: Custom lattice axis scales
### Aliases: scale.components xscale.components.logpower
###   yscale.components.logpower xscale.components.fractions
###   yscale.components.fractions xscale.components.log10ticks
###   yscale.components.log10ticks xscale.components.log
###   yscale.components.log xscale.components.log10.3
###   yscale.components.log10.3 xscale.components.subticks
###   yscale.components.subticks
### Keywords: dplot

### ** Examples

xyplot((1:200)/20 ~ (1:200)/20, type = c("p", "g"),
  scales = list(x = list(log = 2), y = list(log = 10)),
  xscale.components = xscale.components.fractions,
  yscale.components = yscale.components.log10ticks)

xyplot((1:200)/20 ~ (1:200)/20, type = c("p", "g"),
  scales = list(x = list(log = 2), y = list(log = 10)),
  xscale.components = xscale.components.logpower,
  yscale.components = yscale.components.log10.3)

dd <- as.Date("2000-01-01") + 0:365
xyplot(0:365 ~ dd, type = c("p", "g"),
  xscale.components = xscale.components.subticks,
  yscale.components = yscale.components.subticks)



