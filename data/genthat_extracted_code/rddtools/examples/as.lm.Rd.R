library(rddtools)


### Name: as.lm
### Title: Convert a rdd object to lm
### Aliases: as.lm

### ** Examples

data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
reg_para <- rdd_reg_lm(rdd_object=house_rdd)
reg_para_lm <- as.lm(reg_para)
reg_para_lm
plot(reg_para_lm, which=4)



