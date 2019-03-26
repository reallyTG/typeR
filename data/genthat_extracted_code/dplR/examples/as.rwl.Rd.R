library(dplR)


### Name: as.rwl
### Title: as.rwl
### Aliases: as.rwl
### Keywords: manip

### ** Examples

library(graphics)
library(stats)
library(utils)
## Toy
n <- 100
## Make a data.frame that is tree-ring like
base.series <- 0.75 + exp(-0.2 * 1:n)
foo <- data.frame(x1 = base.series + abs(rnorm(n, 0, 0.25)),
                  x2 = base.series + abs(rnorm(n, 0, 0.25)),
                  x3 = base.series + abs(rnorm(n, 0, 0.25)),
                  x4 = base.series + abs(rnorm(n, 0, 0.25)),
                  x5 = base.series + abs(rnorm(n, 0, 0.25)),
                  x6 = base.series + abs(rnorm(n, 0, 0.25)))
# coerce to rwl and use plot and summary methods
foo <- as.rwl(foo)
class(foo)
plot(foo, plot.type="spag")
summary(foo)



