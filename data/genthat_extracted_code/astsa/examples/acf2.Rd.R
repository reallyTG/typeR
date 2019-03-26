library(astsa)


### Name: acf2
### Title: Plot and print ACF and PACF of a time series
### Aliases: acf2
### Keywords: ts

### ** Examples

acf2(rnorm(100))
acf2(rnorm(100), 25, main='')  # no title
acf2(rnorm(100), plot=FALSE)[,'ACF']  # print only ACF



