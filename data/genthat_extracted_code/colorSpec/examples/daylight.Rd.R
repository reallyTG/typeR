library(colorSpec)


### Name: daylight
### Title: Standard Daylight Components
### Aliases: daylight1964 daylight2013 daylight
### Keywords: datasets light

### ** Examples

summary( daylight1964 )
day1964 = daylightSpectra( c(5000,6500), comp=daylight1964 )
day2013 = daylightSpectra( c(5000,6500), comp=daylight2013 )

plot( day1964, col='black' )
plot( day2013, col='black', add=TRUE )




