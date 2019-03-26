library(STAR)


### Name: ShallowShocks
### Title: Shallow Shocks (M >= 6.0) in OFF Tohoku Area for 1885-1980
### Aliases: ShallowShocks
### Keywords: datasets

### ** Examples

data(ShallowShocks)
## Reproduce Fig. 2 of Ogata 1988
layout(matrix(1:3, nrow = 3))
plot(ShallowShocks$Date,
     cumsum(ShallowShocks$energy.sqrt) / 10^13,
     type ="l",
     xlab = "",
     ylab = "",
     main = "Cumulative square root of energy")
plot(ShallowShocks$Date,
     cumsum(1+numeric(dim(ShallowShocks)[1])),
     type ="l",
     xlab = "",
     ylab = "",
     main = "Cumulative number of shocks")
plot(ShallowShocks$Date,
     ShallowShocks$magnitude,
     type = "h",
     ylim = c(5,9),
     xlab = "Time (days)",
     ylab = "",
     main = "Magnitude vs Occurrence time")



