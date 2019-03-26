library(rpart)


### Name: car90
### Title: Automobile Data from 'Consumer Reports' 1990
### Aliases: car90
### Keywords: datasets

### ** Examples

data(car90)
plot(car90$Price/1000, car90$Weight,
     xlab = "Price (thousands)", ylab = "Weight (lbs)")
mlowess <- function(x, y, ...) {
    keep <- !(is.na(x) | is.na(y))
    lowess(x[keep], y[keep], ...)
}
with(car90, lines(mlowess(Price/1000, Weight, f = 0.5)))



