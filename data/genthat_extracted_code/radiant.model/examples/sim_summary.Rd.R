library(radiant.model)


### Name: sim_summary
### Title: Print simulation summary
### Aliases: sim_summary

### ** Examples

simulater(
  const = "cost 3",
  norm = "demand 2000 1000",
  discrete = "price 5 8 .3 .7",
  form = c("profit = demand * (price - cost)", "profit5K = profit > 5000"),
  seed = 1234
) %>% sim_summary()




