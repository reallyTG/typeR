library(dplR)


### Name: hanning
### Title: Hanning Filter
### Aliases: hanning
### Keywords: ts

### ** Examples
library(graphics)
library(utils)
data(ca533)
yrs <- time(ca533)
y <- ca533[, 1]
not.na <- !is.na(y)
yrs <- yrs[not.na]
y <- y[not.na]
plot(yrs, y, xlab = "Years", ylab = "Series1 (mm)",
     type = "l", col = "grey")
lines(yrs, hanning(y, n = 9), col = "red", lwd = 2)
lines(yrs, hanning(y, n = 21), col = "blue", lwd = 2)
legend("topright", c("Series", "n=9", "n=21"),
       fill=c("grey", "red", "blue"))



