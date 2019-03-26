library(rddtools)


### Name: indh
### Title: INDH data set
### Aliases: indh

### ** Examples

# load the data
data(indh)

# construct rdd_data frame
rdd_dat_indh <- rdd_data(y=choice_pg, x=poverty, data=indh, cutpoint=30)

# inspect data frame
summary(rdd_dat_indh)

# perform non-parametric regression
( reg_np_indh <- rdd_reg_np(rdd_dat_indh) )
plot(reg_np_indh)



