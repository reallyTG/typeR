library(radiant.model)


### Name: plot.simulater
### Title: Plot method for the simulater function
### Aliases: plot.simulater

### ** Examples

simdat <- simulater(
  const = "cost 3",
  norm = "demand 2000 1000",
  discrete = "price 5 8 .3 .7",
  form = "profit = demand * (price - cost)",
  seed = 1234
)
plot(simdat, bins = 25)




