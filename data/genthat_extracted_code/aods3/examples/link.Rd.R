library(aods3)


### Name: link
### Title: Transformation from the Observation Scale to the Link Scale
### Aliases: link
### Keywords: math

### ** Examples

x <- seq(.001, .999, length = 100)
plot(x, link(x, type = "logit"), type = "l", lwd = 2, ylab = "link(proba.)")
lines(x, link(x, type = "cloglog"), lty = 2, lwd = 2)
grid(col = "black")
legend(0, 6, legend = c("logit(x)", "cloglog(x)"), lty = c(1, 2), bg = "white")



