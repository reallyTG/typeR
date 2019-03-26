library(ICC)


### Name: effort
### Title: Plots the optimum 'k' measures per individual (or group), based
###   upon a fixed total researcher effort.
### Aliases: effort

### ** Examples

#Example 1
  effort(est.type = "h", e = c(30, 60, 120), ICC = 0.2)

#Example 2
  data(ChickWeight)
  effort(est.type = "p", x = Chick, y = weight, data = ChickWeight)



