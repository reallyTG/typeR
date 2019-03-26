library(colorpatch)


### Name: InterpolateColorFun
### Title: Linear interpolation within a colorspace::color palette
### Aliases: InterpolateColorFun

### ** Examples

library(colorspace)
library(colorpatch)
data("OptimGreenRedLAB")
fn <- InterpolateColorFun(OptimGreenRedLAB)
cols <- fn(seq(-1, 1, by = 0.1))
specplot(cols)



