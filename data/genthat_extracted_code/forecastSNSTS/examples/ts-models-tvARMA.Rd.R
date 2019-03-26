library(forecastSNSTS)


### Name: ts-models-tvARMA
### Title: Simulation of an tvARMA(p) time series.
### Aliases: ts-models-tvARMA tvARMA

### ** Examples

## Taken from Section 6 in Dahlhaus (1997, AoS)
a1 <- function(u) {1.8 * cos(1.5 - cos(4 * pi * u))}
a2 <- function(u) {-0.81}
plot(tvARMA(128, a = list(a1, a2), b = list()), type = "l")



