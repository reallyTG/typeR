library(linear.tools)


### Name: get_x_hidden
### Title: the underlying function of 'get_x'
### Aliases: get_x_hidden
### Keywords: internal

### ** Examples


#
data = ggplot2::diamonds
diamond_lm  =  lm(price~  I(carat^   2) + cut  + carat*table ,ggplot2::diamonds)

#_________ input as model
get_x_hidden(model = diamond_lm,method = 'raw')
get_x_hidden(diamond_lm,method = 'model')
get_x_hidden(diamond_lm,method = 'coeff')

#_______ input as formula
get_x_hidden(formula(diamond_lm),method = 'model')
# data is required when input is formula
get_x_hidden(formula(diamond_lm), data = ggplot2::diamonds, method = 'coeff')

tryCatch(
  get_x_hidden(formula(diamond_lm),method = 'coeff'),
  error =function(err){
    print(err)
  }
)





#________ irregular formulas __________

model_dirty = model = lm(price~  I(carat^   2) + cut  -
                           carat:table - cut ,ggplot2::diamonds)

# WRONG for raw vars
get_x_hidden(model_dirty)

# correct for model vars
get_x_hidden(price~  I(carat^2) + cut  -
               carat:table - cut,
             data = ggplot2::diamonds, method ='model')

get_x_hidden(model_dirty,method = 'model')
get_x_hidden(model_dirty,data = ggplot2::diamonds, method = 'model')
get_x_hidden(model_dirty, method = 'model')

#___________ coeff vars __________

# clean
get_x_hidden(model_dirty, data = ggplot2::diamonds, method = 'coeff')
get_x_hidden(formula(model_dirty),data = ggplot2::diamonds, method = 'coeff')


#
# # dirty
# attr(terms((price~  I(carat^2) + cut  + carat:table - cut)),"factors") %>% colnames()
#
# #______________ test: how to get variables
# model.matrix(formula(model_dirty),data = ggplot2::diamonds) %>% colnames
# terms(formula(diamond_lm)) %>% attr(.,"factors") %>% colnames()
# terms(formula(model_dirty)) %>% attr(.,"factors") %>% colnames()
# terms(formula(model_dirty)) %>% attr(.,"factors") %>% rownames()
#
#
# # clean method for model vars
# terms((price~  I(carat^2) + cut  - carat:table - cut)) %>% attr(.,"factors") %>% colnames()
# model_dirty %>% terms %>% attr(.,"factors") %>% colnames()
# formula(model_dirty) %>% terms %>% attr(.,"factors") %>% colnames()




