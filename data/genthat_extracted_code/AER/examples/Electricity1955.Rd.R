library(AER)


### Name: Electricity1955
### Title: Cost Function of Electricity Producers (1955, Nerlove Data)
### Aliases: Electricity1955
### Keywords: datasets

### ** Examples

data("Electricity1955")
Electricity <- Electricity1955[1:145,]

## Greene (2003)
## Example 7.3
## Cobb-Douglas cost function
fm_all <- lm(log(cost/fuel) ~ log(output) + log(labor/fuel) + log(capital/fuel),
  data = Electricity)
summary(fm_all)

## hypothesis of constant returns to scale
linearHypothesis(fm_all, "log(output) = 1")

## Table 7.4
## log quadratic cost function
fm_all2 <- lm(log(cost/fuel) ~ log(output) + I(log(output)^2) + log(labor/fuel) + log(capital/fuel),
  data = Electricity)
summary(fm_all2)

## More examples can be found in:
## help("Greene2003")



