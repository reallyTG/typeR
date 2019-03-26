library(lineqGPR)


### Name: predict.lineqGP
### Title: Prediction Method for the '"lineqGP"' S3 Class
### Aliases: predict.lineqGP

### ** Examples

# creating the model
sigfun <- function(x) return(1/(1+exp(-7*(x-0.5))))
x <- seq(0, 1, length = 5)
y <- sigfun(x)
model <- create(class = "lineqGP", x, y, constrType = "monotonicity")

# updating and expanding the model
model$localParam$m <- 30
model$kernParam$par <- c(1, 0.2)
model <- augment(model)

# predictions from the model
xtest <- seq(0, 1, length = 100)
ytest <- sigfun(xtest)
pred <- predict(model, xtest)
plot(xtest, ytest, type = "l", lty = 2, main = "Kriging predictions")
lines(xtest, pred$Phi.test %*% pred$mu, type = "l", col = "blue")
lines(xtest, pred$Phi.test %*% pred$xi.map, type = "l", col = "red")
legend("right", c("ytest", "mean", "mode"), lty = c(2,1,1),
       col = c("black", "blue", "red"))




