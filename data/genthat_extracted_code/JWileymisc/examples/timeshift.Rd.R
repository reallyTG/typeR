library(JWileymisc)


### Name: timeshift
### Title: Shift a time variable to have a new center (zero point)
### Aliases: timeshift

### ** Examples

## example showing centering at 11am (i.e., 11am becomes new 0)
plot((1:24)/24, timeshift((1:24)/24, 11/24))

## example showing the inverse, note that 24/24 becomes 0
plot((1:24)/24, timeshift(timeshift((1:24)/24, 11/24), 11/24, inverse = TRUE))



