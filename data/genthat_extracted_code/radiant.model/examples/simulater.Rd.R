library(radiant.model)


### Name: simulater
### Title: Simulate data for decision analysis
### Aliases: simulater

### ** Examples

simulater(
  const = "cost 3",
  norm = "demand 2000 1000",
  discrete = "price 5 8 .3 .7",
  form = "profit = demand * (price - cost)",
  seed = 1234
) %>% str()




