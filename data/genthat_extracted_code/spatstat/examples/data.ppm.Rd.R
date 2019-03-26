library(spatstat)


### Name: data.ppm
### Title: Extract Original Data from a Fitted Point Process Model
### Aliases: data.ppm
### Keywords: spatial manip models

### ** Examples

 data(cells)
 fit <- ppm(cells, ~1, Strauss(r=0.1))
 X <- data.ppm(fit)
 # 'X' is identical to 'cells'



