library(FLAME)


### Name: ATE
### Title: Compute Average Treatment Effect
### Aliases: ATE

### ** Examples

data(toy_data)
result <- FLAME::FLAME_bit(data = toy_data, holdout = toy_data)
FLAME::ATE(result)



