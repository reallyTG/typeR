library(liureg)


### Name: plot.biasliu
### Title: Bias Variance and MSE Trade-off Plot
### Aliases: plot.biasliu
### Keywords: Liu Bias Liu Variance Liu MSE

### ** Examples

mod<-liu(y~., as.data.frame(Hald), d = seq(-5, 5, 0.1))

## for indication of vertical line (biasing parameter d) and
## horizontal line (minimum Liu MSE value corresponding to vertical line)

plot.biasliu(mod)

## without horizontal and vertical line
plot.biasliu(mod, abline = FALSE)



