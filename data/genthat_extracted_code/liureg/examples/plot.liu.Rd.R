library(liureg)


### Name: plot.liu
### Title: Plot of the Liu Coefficients
### Aliases: plot plot.liu
### Keywords: Liu coefficient plot

### ** Examples

mod<-liu(y~., data = as.data.frame(Hald), d = seq(-5, 5, 0.4))
plot(mod)
plot(mod, abline = TRUE)



