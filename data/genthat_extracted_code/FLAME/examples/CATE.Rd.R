library(FLAME)


### Name: CATE
### Title: Get the Size and CATE of Matched Group(s)
### Aliases: CATE

### ** Examples

## No test: 
data(toy_data)
result <- FLAME::FLAME_bit(data = toy_data, holdout = toy_data)
FLAME::CATE(FLAME_object = result, num_covs  = 2)
FLAME::CATE(FLAME_object = result, num_covs  = 2, cov_name = c("X1", "X2"), cov_val = c("2", "2"))
FLAME::CATE(FLAME_object = result, cov_name = c("X1", "X2"), cov_val = c("2", "2"))
## End(No test)



