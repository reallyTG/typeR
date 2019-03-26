library(rddtools)


### Name: rdd_data
### Title: Construct rdd_data
### Aliases: rdd_data

### ** Examples

data(house)
rd<- rdd_data(x=house$x, y=house$y, cutpoint=0)
rd2 <- rdd_data(x=x, y=y, data=house, cutpoint=0)

# The print() function is the same as the print.data.frame:
rd

# The summary() and plot() function are specific to rdd_data
summary(rd)
plot(rd)



