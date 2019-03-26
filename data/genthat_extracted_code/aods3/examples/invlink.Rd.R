library(aods3)


### Name: invlink
### Title: Transformation from the Link Scale to the Observation Scale
### Aliases: invlink
### Keywords: math

### ** Examples

x <- seq(-5, 5, length = 100)
plot(x, invlink(x, type = "logit"), type = "l", lwd = 2, ylab = "Probability")
lines(x, invlink(x, type = "cloglog"), lty = 2, lwd = 2)
grid(col = "black")
legend(-5, 1, legend = c("alogit(x)", "acloglog(x)"), lty = c(1, 2), bg = "white")



