library(linear.tools)


### Name: get_contrast
### Title: get contrast of categorical variables in a model
### Aliases: get_contrast

### ** Examples


get_contrast(lm(price ~ carat + I(carat^2) + cut:carat +
                  color,ggplot2::diamonds))
get_contrast(lm(price ~ carat + I(carat^2) + cut:carat +
                  color,ggplot2::diamonds),return_method = TRUE)

# dirty formulas: all categorical vars are with minus sign
# no categorical vars, thus no contast
get_contrast(lm(price ~ carat + I(carat^2) ,ggplot2::diamonds))

model_dirty = lm(price ~ carat + I(carat^2) - cut:carat - color,
                 ggplot2::diamonds)
get_contrast(model = model_dirty )

diamond_lm3 = lm(price~ I(cut) + depth,ggplot2::diamonds) # a GLM
get_contrast(model = diamond_lm3 )




