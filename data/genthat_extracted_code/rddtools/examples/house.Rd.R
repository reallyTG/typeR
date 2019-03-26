library(rddtools)


### Name: house
### Title: Dataset used in Lee (2008)
### Aliases: house

### ** Examples

data(house)
rdd_house <- rdd_data(x=x, y=y, data=house, cutpoint=0)
summary(rdd_house)
plot(rdd_house)



