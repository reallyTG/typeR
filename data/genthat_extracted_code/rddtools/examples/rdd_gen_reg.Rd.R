library(rddtools)


### Name: rdd_gen_reg
### Title: General polynomial estimator of the regression discontinuity
### Aliases: rdd_gen_reg

### ** Examples

## Step 0: prepare data
data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)

## Estimate a local probit:
house_rdd$y <- with(house_rdd, ifelse(y<quantile(y, 0.25), 0,1))
reg_bin_glm <- rdd_gen_reg(rdd_object=house_rdd, fun= glm, family=binomial(link='probit'))
print(reg_bin_glm)
summary(reg_bin_glm)



