library(linear.tools)


### Name: deleting_wrongeffect
### Title: check monotonicity of marginal impacts and re-estimate the
###   model.
### Aliases: deleting_wrongeffect

### ** Examples


##
set.seed(413)
traing_data = ggplot2::diamonds[runif(nrow(ggplot2::diamonds))<0.05,]
nrow(traing_data)

diamond_lm3 = lm(formula = price ~ carat + I(carat^2) + I(carat^3) + cut +
                   I(carat * depth) , data = traing_data)


test = deleting_wrongeffect(model = diamond_lm3,
                            focus_var_raw = 'carat',
                            focus_var_model = c("I(carat^3)","I(carat*depth)",
                                                "I(carat^2)","I(carat)"),
                            focus_value = list(carat=seq(0.5,6,0.1)),
                            data = traing_data,
                            PRINT = TRUE,STOP = FALSE,
                            Reverse = FALSE)


## two focus on vars
test =
  deleting_wrongeffect(model = diamond_lm3 ,
                       focus_var_raw = c('carat',"cut"),
                       focus_var_model = c("I(carat*depth)","I(carat^3)"),
                       focus_value = list(carat=seq(0.5,6,0.1)),
                       data = traing_data,PRINT = TRUE,STOP =FALSE)

diamond_lm3 = lm(formula = price ~ cut + depth +
                   I(carat * depth) , data = ggplot2::diamonds)
##  negative signs
deleting_wrongeffect(model = diamond_lm3 ,
                     focus_var_raw = c('depth',"cut"),
                     focus_var_model = c("depth"),Monoton_to_Match = -1,
                     data = ggplot2::diamonds,PRINT = TRUE,STOP =FALSE)

## wrong variables names
deleting_wrongeffect(diamond_lm3, focus_var_raw = 'carat',
                     focus_var_model = c("I(cara79t^3)"),
                     data = ggplot2::diamonds,PRINT = TRUE)

deleting_wrongeffect(diamond_lm3, focus_var_raw = 'carat890',
                     focus_var_model = c("I(carat^3)"),
                     data = ggplot2::diamonds, PRINT = TRUE)




