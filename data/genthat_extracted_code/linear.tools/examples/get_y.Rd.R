library(linear.tools)


### Name: get_y
### Title: get y (right hand of var)
### Aliases: get_y

### ** Examples


get_y(log(price) ~sdfsf + dsa )
get_y(log(price) ~ sdfsf + dsa, method = "model")
get_y(log(price) ~ sdfsf + dsa, method = "coeff") # same as model var in the get_y() case

# can deal with un-regular formula
get_y(log(price) ~sdfsf + dsa ~ dsad)
get_y(log(price) ~ sdfsf + dsa ~ dsad, method = "coeff")
get_y(log(price) ~ sdfsf + dsa ~ dsad, method = "model")

model_dirty = model = lm(price~  I(carat^   2) + cut  - carat:table - cut ,ggplot2::diamonds)
get_y(model_dirty)




