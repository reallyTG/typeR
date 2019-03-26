library(c3)


### Name: c3_mixedGeom
### Title: Mixed Geometry Plots
### Aliases: c3_mixedGeom

### ** Examples

data <- data.frame(a = abs(rnorm(20) *10),
                   b = abs(rnorm(20) *10),
                   c = abs(rnorm(20) *10),
                   d = abs(rnorm(20) *10))
data %>%
  c3() %>%
  c3_mixedGeom(type = 'bar',
               stacked = c('b','d'),
               types = list(a='area',
                            c='spline'))




