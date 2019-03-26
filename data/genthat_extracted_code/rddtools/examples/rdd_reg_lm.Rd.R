library(rddtools)


### Name: rdd_reg_lm
### Title: Parametric polynomial estimator of the regression discontinuity
### Aliases: rdd_reg_lm

### ** Examples

## Step 0: prepare data
data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
## Step 2: regression
# Simple polynomial of order 1:
reg_para <- rdd_reg_lm(rdd_object=house_rdd)
print(reg_para)
plot(reg_para)

# Simple polynomial of order 4:
reg_para4 <- rdd_reg_lm(rdd_object=house_rdd, order=4)
reg_para4
plot(reg_para4)

# Restrict sample to bandwidth area:
bw_ik <- rdd_bw_ik(house_rdd)
reg_para_ik <- rdd_reg_lm(rdd_object=house_rdd, bw=bw_ik, order=4)
reg_para_ik
plot(reg_para_ik)



