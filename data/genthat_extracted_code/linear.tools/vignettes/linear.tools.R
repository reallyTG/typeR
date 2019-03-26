## ---- echo=F, message=FALSE, warning=FALSE-------------------------------
library(knitr)
opts_chunk$set(
  fig.width=5, 
  fig.height=3
)

library(linear.tools)
# source("/Users/yangguodaxia/Dropbox/Tech/R/linear_tools_origin.R")


## ------------------------------------------------------------------------
data = ggplot2::diamonds
diamond_lm  =  lm(log(price)~  I(carat^   2) + cut  + carat + table + carat:table, data)

## ------------------------------------------------------------------------
get_x(diamond_lm,'model')

## ------------------------------------------------------------------------
get_x(diamond_lm,'raw')

## ------------------------------------------------------------------------
get_model_pair(diamond_lm, data, 'raw')

## ------------------------------------------------------------------------
get_x(diamond_lm,'coeff')

## ------------------------------------------------------------------------
get_model_pair(diamond_lm, data, 'coeff')

## ------------------------------------------------------------------------
get_x_all(model = diamond_lm)

## ------------------------------------------------------------------------
get_y(diamond_lm,'raw')
get_y(diamond_lm,'model')

## ------------------------------------------------------------------------
# get_contrast will return a list with each element as the contrasts of a categorical variable in the model
get_contrast(diamond_lm)

## ------------------------------------------------------------------------
get_contrast(diamond_lm, return_method = T)

## ------------------------------------------------------------------------
# more carats, higher price.
diamond_lm3 = lm(price~  carat + I(carat^2) + I(carat^3) , ggplot2::diamonds) # a GLM

test1 = effect(model = diamond_lm3, focus_var_raw = c('carat'), focus_value =list(carat = seq(0.5,1,0.1))) 
test1$Monoton_Increase

## ------------------------------------------------------------------------
test_interaction = effect(model = lm(price~  carat*cut + I(carat^2)*cut, ggplot2::diamonds), 
       focus_var_raw = c('carat','cut'), focus_value =list(carat = seq(0.5,1,0.1))
       ) 

## ------------------------------------------------------------------------
test2 = effect(model = diamond_lm3, focus_var_raw = c('carat'), focus_value =list(carat = seq(0.5,6,0.1))) 
test2$Monoton_Increase

## ------------------------------------------------------------------------

model_correct_effect = deleting_wrongeffect(model = diamond_lm3,
                                            focus_var_raw = 'carat',
                                            focus_value = list(carat=seq(0.5,6,0.1)),
                                            data = ggplot2::diamonds,
                                            PRINT = T,STOP =F, PLOT = T,
                                            Reverse = F)
model_correct_effect

## ------------------------------------------------------------------------
scope = list(lower = price ~ 1,
             upper = price ~  carat + I(carat^2) + I(carat^3) + I(carat * depth) + depth)


### specify the correct marginal effect here
test_suit = list(
  carat = list( # the list name must be the raw var
    focus_var_raw = "carat", # must specify the focus_var_raw (see deleting_wrongeffect() ) as the raw var
    focus_value = list(carat=seq(0.5,6,0.1))
  )
)

model_correct_effect =  stepwise2(model = diamond_lm3, scope = scope, trace = T,
                                  data = ggplot2::diamonds, STOP = F, test_suit = test_suit)
# the returned model
model_correct_effect


## ------------------------------------------------------------------------
test_model_correct_effect = effect(model = model_correct_effect, focus_var_raw = c('carat'), focus_value =list(carat = seq(0.5,6,0.1))) 

## ------------------------------------------------------------------------
model_wrong_effect =  step(diamond_lm3, scope = scope, trace = F, data = ggplot2::diamonds)
model_wrong_effect
test_wrong_effect = effect(model_wrong_effect, focus_var_raw = c('carat'), focus_value =list(carat = seq(0.5,6,0.1))) 

