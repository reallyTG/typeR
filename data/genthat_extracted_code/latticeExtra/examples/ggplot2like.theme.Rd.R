library(latticeExtra)


### Name: ggplot2like.theme
### Title: A ggplot2-like theme for Lattice
### Aliases: ggplot2like.theme ggplot2like.opts ggplot2like axis.grid
### Keywords: dplot

### ** Examples

set.seed(0)

## basic theme does not include white grid lines
xyplot(exp(1:10) ~ 1:10, type = "b", 
    par.settings = ggplot2like())

## add lines for axis ticks with custom axis function
xyplot(exp(1:10) ~ 1:10, type = "b", 
    par.settings = ggplot2like(), axis = axis.grid)
    
## this can be used together with scale.components
## (minor lines only visible on devices supporting translucency)
xyplot(exp(rnorm(500)) ~ rnorm(500),
    scales = list(y = list(log = TRUE)),
    yscale.components = yscale.components.log10ticks,
    par.settings = ggplot2like(), axis = axis.grid)

## ggplotlike.opts() specifies axis = axis.grid as well as
## xscale.components.subticks / yscale.components.subticks

xyg <- make.groups(
    "group one" = rnorm(80, 1),
    "group two" = rnorm(80, 5),
    "group three" = rnorm(80, 2))
xyg$x <- rev(xyg$data)

## group styles: specify number of equi-spaced hues
xyplot(data ~ x, xyg, groups = which, auto.key = TRUE, 
    par.settings = ggplot2like(n = 3),
    lattice.options = ggplot2like.opts()) +
  glayer(panel.smoother(...))

## or set it as the default:
opar <- trellis.par.get()
trellis.par.set(ggplot2like(n = 4, h.start = 180))
oopt <- lattice.options(ggplot2like.opts())

bwplot(voice.part ~ height, data = singer)

histogram(rnorm(100))

barchart(Titanic[,,,"No"], main = "Titanic deaths",
    layout = c(1, 2), auto.key = list(columns = 2))

## reset
trellis.par.set(opar)
lattice.options(oopt)

## axis.grid and scale.components.subticks can be used alone:
## (again, lines for minor ticks need transculency-support to show up)
xyplot(exp(1:10) ~ 1:10, type = "b", 
    lattice.options = ggplot2like.opts(),
    par.settings = list(axis.line = list(col = NA),
        reference.line = list(col = "grey")),
    scales = list(tck = c(0,0)))



