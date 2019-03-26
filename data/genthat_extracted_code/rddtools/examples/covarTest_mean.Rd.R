library(rddtools)


### Name: covarTest_mean
### Title: Testing for balanced covariates: equality of means with t-test
### Aliases: covarTest_mean covarTest_mean.rdd_data covarTest_mean.rdd_reg

### ** Examples

data(house)

## Add randomly generated covariates
set.seed(123)
n_Lee <- nrow(house)
Z <- data.frame(z1 = rnorm(n_Lee, sd=2),
                z2 = rnorm(n_Lee, mean = ifelse(house<0, 5, 8)),
                z3 = sample(letters, size = n_Lee, replace = TRUE))
house_rdd_Z <- rdd_data(y = house$y, x = house$x, covar = Z, cutpoint = 0)

## test for equality of means around cutoff:
covarTest_mean(house_rdd_Z, bw=0.3)

## Can also use function covarTest_dis() for Kolmogorov-Smirnov test:
covarTest_dis(house_rdd_Z, bw=0.3)

## covarTest_mean works also on regression outputs (bw will be taken from the model)
reg_nonpara <- rdd_reg_np(rdd_object=house_rdd_Z)
covarTest_mean(reg_nonpara)



