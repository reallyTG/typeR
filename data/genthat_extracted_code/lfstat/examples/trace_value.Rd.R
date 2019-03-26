library(lfstat)


### Name: trace_value
### Title: Draw Paths to Points perpendicular to Coordinate Axis
### Aliases: trace_value
### Keywords: low-flow aplot

### ** Examples

x <- c(-2, 3)
curve(sin, -2*pi, 2*pi, xname = "t")
trace_value(x, sin(x), digits = c(0, 1))



