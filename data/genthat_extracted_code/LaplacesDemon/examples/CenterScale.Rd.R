library(LaplacesDemon)


### Name: CenterScale
### Title: Centering and Scaling
### Aliases: CenterScale
### Keywords: Center Centering Predictor Scale Scaling Transformation

### ** Examples

### See the LaplacesDemon function for an example in use.
library(LaplacesDemon)
x <- rnorm(100,10,1)
x.cs <- CenterScale(x)
x.orig <- CenterScale(x.cs, Inverse=TRUE, mu=mean(x), sigma=sd(x))



