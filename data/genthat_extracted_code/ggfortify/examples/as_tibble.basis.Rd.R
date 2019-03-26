library(ggfortify)


### Name: as_tibble.basis
### Title: Convert a spline basis to a tibble
### Aliases: as_tibble.basis

### ** Examples

library(splines)
library(tibble)
x <- seq(0, 1, by=0.001)
spl <- bs(x, df=6)
as_tibble(spl)



