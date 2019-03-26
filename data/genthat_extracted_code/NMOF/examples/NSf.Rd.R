library(NMOF)


### Name: NSf
### Title: Factor Loadings for Nelson-Siegel and Nelson-Siegel-Svensson
### Aliases: NSf NSSf

### ** Examples

## Nelson-Siegel
cor(NSf(lambda = 6, tm = 1:10)[-1L, -1L])

## Nelson-Siegel-Svensson
cor(NSSf(lambda1 = 1, lambda2 = 5, tm = 1:10)[-1L, -1L])
cor(NSSf(lambda1 = 4, lambda2 = 9, tm = 1:10)[-1L, -1L])



