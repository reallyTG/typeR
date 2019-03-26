library(cobs)


### Name: DublinWind
### Title: Daily Wind Speeds in Dublin
### Aliases: DublinWind
### Keywords: datasets

### ** Examples

data(DublinWind)
str(DublinWind)
plot(speed ~ day, data = DublinWind)# not so nice; want time scale

## transform 'day' to correct "Date" object; and then plot
Dday <- seq(from = as.Date("1961-01-01"), by = 1,
            length = nrow(DublinWind))
plot(speed ~ Dday, data = DublinWind, type = "l",
     main = paste("DublinWind speed daily data, n=",
                  nrow(DublinWind)))

##--- ~ He & Ng "Example 3" %% much more is in ../tests/wind.R
co.o50 <-
 with(DublinWind, ## use nknots > (default) 6 :
  cobs(day, speed, knots.add = TRUE, constraint= "periodic", nknots = 10,
       tau = .5, method = "uniform"))
summary(co.o50)
lines(Dday, fitted(co.o50), col=2, lwd = 2)

## the periodic "smooth" function - in one period
plot(predict(co.o50), type = "o", cex = 0.2, col=2,
     xlab = "day", ylim = c(0,20))
points(speed ~ day, data = DublinWind, pch = ".")



