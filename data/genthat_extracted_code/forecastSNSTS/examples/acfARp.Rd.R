library(forecastSNSTS)


### Name: acfARp
### Title: Compute autocovariances of an AR(p) process
### Aliases: acfARp

### ** Examples

## Taken from Section 6 in Dahlhaus (1997, AoS)
a1 <- function(u) {1.8 * cos(1.5 - cos(4*pi*u))}
a2 <- function(u) {-0.81}
# local autocovariance for u === 1/2: lag 1
acfARp(a = c(a1(1/2), a2(1/2)), sigma = 1, k = 1)
# local autocovariance for u === 1/2: lag -2
acfARp(a = c(a1(1/2), a2(1/2)), sigma = 1, k = -1)
# local autocovariance for u === 1/2: the variance
acfARp(a = c(a1(1/2), a2(1/2)), sigma = 1, k = 0)



