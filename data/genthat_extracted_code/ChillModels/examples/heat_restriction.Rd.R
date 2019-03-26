library(ChillModels)


### Name: heat_restriction
### Title: Heat Restriction model
### Aliases: heat_restriction

### ** Examples


x <- rnorm(500, 15, 5)

#5 hours of heat to stop counting the negative units.
heat_restriction(x, model = "nc",nh = 5)

#24 hours of heat to stop counting the negative units.
heat_restriction(x, model = "nc", nh = 24)




