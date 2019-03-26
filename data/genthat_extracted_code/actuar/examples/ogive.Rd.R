library(actuar)


### Name: ogive
### Title: Ogive for Grouped Data
### Aliases: ogive ogive.default ogive.grouped.data print.ogive
###   summary.ogive knots.ogive plot.ogive
### Keywords: dplot hplot

### ** Examples

## Most common usage: create ogive from grouped data object.
Fn <- ogive(gdental)
Fn
summary(Fn)
knots(Fn)                      # the group boundaries

Fn(knots(Fn))                  # true values of the empirical cdf
Fn(c(80, 200, 2000))           # linear interpolations

plot(Fn)                       # graphical representation

## Alternative 1: create ogive directly from individual data
## without first creating a grouped data object.
ogive(dental)                  # automatic class boundaries
ogive(dental, breaks = c(0, 50, 200, 500, 1500, 2000))

## Alternative 2: create ogive from set of group boundaries and
## group frequencies.
cj <- c(0, 25, 50, 100, 250, 500, 1000)
nj <- c(30, 31, 57, 42, 45, 10)
ogive(cj, nj)



