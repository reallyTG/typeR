library(ggformula)


### Name: gf_spoke
### Title: Formula interface to geom_spoke()
### Aliases: gf_spoke

### ** Examples

SomeData <- expand.grid(x = 1:10, y=1:10)
SomeData$angle <- runif(100, 0, 2*pi)
SomeData$speed <- runif(100, 0, sqrt(0.1 * SomeData$x))

gf_point(y ~ x, data = SomeData) %>%
  gf_spoke(y ~ x, angle = ~ angle, radius = 0.5)

gf_point(y ~ x, data = SomeData) %>%
  gf_spoke(y ~ x, angle = ~ angle, radius = ~ speed)



