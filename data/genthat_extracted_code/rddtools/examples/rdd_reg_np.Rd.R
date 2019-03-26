library(rddtools)


### Name: rdd_reg_np
### Title: Parametric polynomial estimator of the regression discontinuity
### Aliases: rdd_reg_np

### ** Examples

## Step 0: prepare data
data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
## Step 2: regression
# Simple polynomial of order 1:
reg_nonpara <- rdd_reg_np(rdd_object=house_rdd)
print(reg_nonpara)
plot(reg_nonpara)



