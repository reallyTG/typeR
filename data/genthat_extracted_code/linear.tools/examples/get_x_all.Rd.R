library(linear.tools)


### Name: get_x_all
### Title: a unique combinations of model vars, coeff vars and raw vars
### Aliases: get_x_all

### ** Examples


get_x_all(model = price~  I(carat^   2) + cut  + I(carat*table),data = ggplot2::diamonds)


#________ irregular formulas
model_dirty = lm(price~  I(carat^   2) + cut  - carat:table - cut ,ggplot2::diamonds)
test = get_x_all(model_dirty)

test
test$coeff
# ______  errors _______________

tryCatch(get_x_all(model = price~  I(carat^   2) + cut  + I(carat*table)),
         error = function(x){
           print(x)
         })




