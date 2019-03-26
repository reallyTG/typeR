library(FLAME)


### Name: MATCH
### Title: Get Matched Units Given Certain Covariate Combination
### Aliases: MATCH

### ** Examples

data(toy_data)
result <- FLAME::FLAME_bit(data = toy_data, holdout = toy_data)
FLAME::MATCH(FLAME_object = result, cov_name = c("X1", "X2"), cov_val = c("2", "2"))



