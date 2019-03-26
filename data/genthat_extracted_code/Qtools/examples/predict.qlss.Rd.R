library(Qtools)


### Name: predict.qlss
### Title: Predictions from Conditional LSS Objects
### Aliases: predict.qlss
### Keywords: predict

### ** Examples


# Fit QLSS object
trees2 <- trees[order(trees$Height),]
fit <- qlss(Volume ~ Height, data = trees2)

## Predict using newdata. Calculate confidence intervals using 200 bootstrap replications

xx <- seq(min(trees2$Height), max(trees2$Height), length = 100)
new <- data.frame(Height = xx)
set.seed(121)
fit.pred <- predict(fit, newdata = new, interval = TRUE, level = 0.95, R = 200)
plot(fit.pred, z = xx, interval = TRUE, xlab = "height")
# large confidence intervals for shape index due
# to small IQR at low values of height

# Restrict range for Height

xx <- seq(65, 87, length = 100)
new <- data.frame(Height = xx)
set.seed(121)
fit.pred <- predict(fit, newdata = new, interval = TRUE, level = 0.95, R = 200)
plot(fit.pred, z = xx, interval = TRUE, xlab = "height") # better




