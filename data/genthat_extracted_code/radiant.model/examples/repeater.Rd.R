library(radiant.model)


### Name: repeater
### Title: Repeated simulation
### Aliases: repeater

### ** Examples

simdat <- simulater(
  const = c("var_cost 5","fixed_cost 1000"),
  norm = "E 0 100;",
  discrete = "price 6 8 .3 .7;",
  form = c(
    "demand = 1000 - 50*price + E",
    "profit = demand*(price-var_cost) - fixed_cost",
    "profit_small = profit < 100"
  ),
  seed = 1234
)

repdat <- repeater(
  simdat,
  nr = 12,
  vars = c("E","price"),
  sum_vars = "profit",
  byvar = "sim",
  form = "profit_365 = profit < 36500",
  seed = 1234,
)

head(repdat)
summary(repdat)
plot(repdat)




