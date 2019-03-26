library(linear.tools)


### Name: get_x
### Title: get x (left hand of var) from model or formula
### Aliases: get_x

### ** Examples


# use the sample code from get_x_hidden
#
data = ggplot2::diamonds
diamond_lm  =  lm(price~  I(carat^   2) + cut  + carat*table ,ggplot2::diamonds)

#_________ input as model
get_x(model = diamond_lm,method = 'raw')
get_x(diamond_lm,method = 'model')
get_x(diamond_lm,method = 'coeff')

#_______ input as formula
get_x(formula(diamond_lm),method = 'model')
# data is required when input is formula
get_x(formula(diamond_lm), data = ggplot2::diamonds, method = 'coeff')

tryCatch(
  get_x(formula(diamond_lm),method = 'coeff'),
  error =function(err){
    print(err)
  }
)



#________ irregular formulas __________

model_dirty = model = lm(price~  I(carat^   2) + cut  - carat:table - cut ,ggplot2::diamonds)

# CORRECT for raw vars
get_x(model_dirty)

# correct for model vars
get_x(price~  I(carat^2) + cut  - carat:table - cut,data = ggplot2::diamonds, method ='model')
get_x(model_dirty,method = 'model')
get_x(model_dirty,data = ggplot2::diamonds, method = 'model')
get_x(model_dirty, method = 'model')

# clean method for model vars
# terms((price~  I(carat^2) + cut  - carat:table - cut)) %>% attr(.,"factors") %>% colnames()
# model_dirty %>% terms %>% attr(.,"factors") %>% colnames()
# formula(model_dirty) %>% terms %>% attr(.,"factors") %>% colnames()




