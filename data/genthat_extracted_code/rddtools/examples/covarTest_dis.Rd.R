library(rddtools)


### Name: covarTest_dis
### Title: Testing for balanced covariates: equality of distribution
### Aliases: covarTest_dis covarTest_dis.rdd_data covarTest_dis.rdd_reg

### ** Examples

data(house)

## Add randomly generated covariates
set.seed(123)
n_Lee <- nrow(house)
Z <- data.frame(z1 = rnorm(n_Lee, sd=2),
                z2 = rnorm(n_Lee, mean = ifelse(house<0, 5, 8)),
                z3 = sample(letters, size = n_Lee, replace = TRUE))
house_rdd_Z <- rdd_data(y = house$y, x = house$x, covar = Z, cutpoint = 0)

## Kolmogorov-Smirnov test of equality in distribution:
covarTest_dis(house_rdd_Z, bw=0.3)

## Can also use function covarTest_dis() for a t-test for equality of means around cutoff:
covarTest_mean(house_rdd_Z, bw=0.3)
## covarTest_dis works also on regression outputs (bw will be taken from the model)
reg_nonpara <- rdd_reg_np(rdd_object=house_rdd_Z)
covarTest_dis(reg_nonpara)



