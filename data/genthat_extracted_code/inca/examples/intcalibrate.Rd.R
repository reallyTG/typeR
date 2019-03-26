library(inca)


### Name: intcalibrate
### Title: Integer Calibration Function
### Aliases: intcalibrate

### ** Examples

library(inca)
set.seed(0)
w <- rpois(150, 4)
data <- matrix(rbinom(150000, 1, .3) * rpois(150000, 4), 1000, 150)
y <- data %*% w
w <- runif(150, 0, 7.5)
print(sum(abs(y - data %*% w)))
cw <- intcalibrate(w, ~. + 0, y, lower = 1, upper = 7, sparse = TRUE, data = data)
print(sum(abs(y - data %*% cw)))
barplot(table(cw), main = "Calibrated integer weights")




