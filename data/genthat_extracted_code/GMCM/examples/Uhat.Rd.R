library(GMCM)


### Name: Uhat
### Title: Fast ranking function
### Aliases: Uhat

### ** Examples

data <- SimulateGMMData()
par(mfrow = c(1,2))
plot(data$z, xlab = expression(z[1]), ylab = expression(z[2]))
plot(Uhat(data$z),
     xlab = expression(hat(u)[1]),
     ylab = expression(hat(u)[2]))



