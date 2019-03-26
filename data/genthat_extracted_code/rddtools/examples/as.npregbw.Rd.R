library(rddtools)


### Name: as.npregbw
### Title: Convert an rdd_reg object to a 'npreg' object
### Aliases: as.npreg as.npregbw

### ** Examples

# Estimate ususal rdd_reg:
 data(house)
 house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
 reg_nonpara <- rdd_reg_np(rdd_object=house_rdd)

## Convert to npreg:
 reg_nonpara_np <- as.npreg(reg_nonpara)
 reg_nonpara_np
 rdd_coef(reg_nonpara_np, allCo=TRUE, allInfo=TRUE)

## Compare with result obtained with a Gaussian kernel:
 bw_lm <- dnorm(house_rdd$x, sd=rddtools:::getBW(reg_nonpara))
 reg_nonpara_gaus <- rdd_reg_lm(rdd_object=house_rdd, w=bw_lm)
 all.equal(rdd_coef(reg_nonpara_gaus),rdd_coef(reg_nonpara_np))



