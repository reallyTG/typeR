library(linear.tools)


### Name: get_data_from_lm
### Title: get raw data from lm or glm
### Aliases: get_data_from_lm
### Keywords: internal

### ** Examples


data_used = ggplot2::diamonds[0:10,]
model = lm(price~ cut + carat + I(carat^2) + I(carat^3) +
             I(carat  * depth) + cut:depth, data_used) # a GLM
get_data_from_lm(model)

data_used = 'data_used is deleted in this environment'
get_data_from_lm(model)




