library(VGAMextra)


### Name: ap.mx
### Title: Air pollution Data, Mexico City.
### Aliases: ap.mx
### Keywords: datasets

### ** Examples

data(ap.mx)
summary(ap.mx[, -1])
class(ap.mx[, "PM10"])
## No test: 
layout(matrix(c(1, 1, 2,3), 2, 2, byrow = TRUE))
plot.ts(ts(ap.mx$PM10), ylab = expression(PM[10]~"Series"), 
        col = "brown", xaxt = "n", las = 1)
xtick <- c(1, 92, 183, 275, 367, 457, 518)
xtext <- c("Jan/04", "April/04", "July/04", "Oct/04", "Jan/05",
           "April/05", "June/05")
axis(side = 1, at = xtick, labels = FALSE)
text(x = xtick, par("usr")[3], labels = xtext,
     pos = 1, xpd = TRUE, col = "black")
pacf(ap.mx$PM10, main = "", ylim= c(-0.5, 1), lag.max = 60, las = 1)
acf(ap.mx$PM10, main = "", ylim= c(-0.5, 1), lag.max = 60, las = 1)
## End(No test)



