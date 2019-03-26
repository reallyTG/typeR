library(linear.tools)


### Name: get_model_pair
### Title: get a list of model vars with their corresponding coeff vars or
###   raw vars.
### Aliases: get_model_pair

### ** Examples


# return coeff
get_model_pair(model = price~  I(carat^2) + cut  + carat*table, data = ggplot2::diamonds)
# return raw vars
get_model_pair(price~  I(carat^2) + cut  + carat*table, data= ggplot2::diamonds, pair_with = 'raw')

# correctly deal with irregular formulas
model_dirty = lm(price~  I(carat^   2) + cut  - carat:table - cut ,ggplot2::diamonds)
get_model_pair(model_dirty,pair_with = 'raw')




