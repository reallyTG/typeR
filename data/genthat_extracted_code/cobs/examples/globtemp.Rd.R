library(cobs)


### Name: globtemp
### Title: Annual Average Global Surface Temperature
### Aliases: globtemp
### Keywords: datasets

### ** Examples

data(globtemp)
plot(globtemp, main = "Annual Global Temperature Deviations")
str(globtemp)
## forget about time-series, just use numeric vectors:
year <- as.vector(time(globtemp))
temp <- as.vector(globtemp)

##---- Code for Figure 1a of He and Ng (1999) ----------

a50 <- cobs(year, temp, knots.add = TRUE, degree = 1, constraint = "increase")
summary(a50)
## As suggested in the warning message, we increase the number of knots to 9
a50 <- cobs(year, temp, nknots = 9, knots.add = TRUE, degree = 1,
            constraint = "increase")
summary(a50)
## Here, we use the same knots sequence chosen for the 50th percentile
a10 <- cobs(year, temp, nknots = length(a50$knots), knots = a50$knot,
            degree = 1, tau = 0.1, constraint = "increase")
summary(a10)
a90 <- cobs(year, temp, nknots = length(a50$knots), knots = a50$knot,
            degree = 1, tau = 0.9, constraint = "increase")
summary(a90)

which(hot.idx  <- temp >= a90$fit)
which(cold.idx <- temp <= a10$fit)
normal.idx <- !hot.idx & !cold.idx

plot(year, temp, type = "n", ylab = "Temperature (C)", ylim = c(-.7,.6))
lines(predict(a50, year, interval = "both"), col = 2)
lines(predict(a10, year, interval = "both"), col = 3)
lines(predict(a90, year, interval = "both"), col = 3)
points(year, temp, pch = c(1,3)[2 - normal.idx])

## label the "hot" and "cold" days
text(year[hot.idx], temp[hot.idx] + .03, labels = year[hot.idx])
text(year[cold.idx],temp[cold.idx]- .03, labels = year[cold.idx])



