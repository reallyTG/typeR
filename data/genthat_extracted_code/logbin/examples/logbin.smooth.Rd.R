library(logbin)


### Name: logbin.smooth
### Title: Smooth Log-Binomial Regression
### Aliases: logbin.smooth
### Keywords: regression smooth

### ** Examples

## Simple example
x <- c(0.3, 0.2, 0.0, 0.1, 0.2, 0.1, 0.7, 0.2, 1.0, 0.9)
y <- c(5, 4, 6, 4, 7, 3, 6, 5, 9, 8)
system.time(m1 <- logbin.smooth(cbind(y, 10-y) ~ B(x, knot.range = 0:2), mono = 1, trace = 1))
## Compare with accelerated version
system.time(m1.acc <- update(m1, accelerate = "squarem"))
## Isotonic relationship
m2 <- logbin.smooth(cbind(y, 10-y) ~ Iso(x))
## No test: 
plot(m1)
plot(m2)
## End(No test)
summary(predict(m1, type = "response"))
summary(predict(m2, type = "response"))



