library(liureg)


### Name: plot.infoliu
### Title: Model Selection Criteria Plots
### Aliases: plot.infoliu
### Keywords: Model Selection Criteria AIC BIC

### ** Examples

mod<- liu(y~., as.data.frame(Hald), d = seq(-5, 5, 0.1))
## for indication of minimum MSE at Liu df (as vertical line)
plot.infoliu(mod)

## without vertical line
plot.infoliu(mod, abline = FALSE)



