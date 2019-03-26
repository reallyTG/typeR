library(liureg)


### Name: dest.liu
### Title: Computation of Liu Biasing Parameter d
### Aliases: dest dest.liu print.dliu
### Keywords: Liu biasing parameter

### ** Examples

mod<-liu(y ~ ., data = as.data.frame(Hald), d = seq(-5, 5, 0.1))
dest(mod)
## Vector of GCV values for each d
dest(mod)$GCV



