library(aRpsDCA)


### Name: arps.with.buildup
### Title: Arps declines with linear buildup period
### Aliases: arps.with.buildup

### ** Examples

## hyperbolic decline with
## qi = 500 bopd, Di = 3.91 nominal / year, b = 1.5,
## cumulative production at t = 5 years
decline <- arps.decline(
    rescale.by.time(500, from="day", to="year", method="rate"),
    3.91, 1.5)
# add buildup from initial rate of 50 bopd, over 30 days
decline.with.buildup <- arps.with.buildup(decline,
    rescale.by.time(50, from="day", to="year", method="rate"),
    rescale.by.time(30, from="day", to="year", method="time"))
# forecast 5 years and compare
forecast.time <- seq(0, 5, 0.1)
plot(arps.q(decline, forecast.time) ~ forecast.time, log="y", type="l",
    lty="dashed", col="red")
lines(arps.q(decline.with.buildup, forecast.time) ~ forecast.time,
    lty="dotted", col="blue")



