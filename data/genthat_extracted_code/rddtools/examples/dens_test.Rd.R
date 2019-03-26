library(rddtools)


### Name: dens_test
### Title: Run the McCracy test for manipulation of the forcing variable
### Aliases: dens_test

### ** Examples

data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
dens_test(house_rdd)



