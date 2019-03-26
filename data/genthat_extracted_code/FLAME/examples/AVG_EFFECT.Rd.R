library(FLAME)


### Name: AVG_EFFECT
### Title: Compute Estimated Treatment Effects
### Aliases: AVG_EFFECT

### ** Examples

data(toy_data)
result <- FLAME::FLAME_bit(data = toy_data, holdout = toy_data)
CATE_object <- FLAME::CATE(FLAME_object = result, cov_name = c("X1", "X2"), cov_val = c("2", "2"))
FLAME::AVG_EFFECT(CATE_object)



