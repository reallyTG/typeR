library(linear.tools)


### Name: effect
### Title: evaluate the marginal effects of the selected raw variable on
###   the dependent.
### Aliases: effect

### ** Examples


##___ unit test ____

# __________________  One Dimension: the most basic case ____________________



set.seed(413)
traing_data = ggplot2::diamonds[runif(nrow(ggplot2::diamonds))<0.05,]
nrow(traing_data)

diamond_lm3 = lm(price~ cut + carat + I(carat^2) +
                   I(carat^3) + I(carat  * depth) + cut:depth, traing_data) # a GLM

# more carats, higher price.
effect(model = diamond_lm3,
       data = traing_data,
       focus_var_raw = c('carat'),
       Reverse = TRUE) # value in x-axis is reverse

# focus on only 'I(carat^3)', which means we will make all other coeff,
# including 'carat' and 'I(carat^2)' into 0
effect(model = diamond_lm3,
       data =traing_data,
       focus_var_raw =c('carat'),
       focus_var_coeff = 'I(carat^3)')
# __________________  One Dimension: Categorical ____________________

# selected model-var to focus: here not focus on cut:depth, only focus on cut
suppressWarnings(
  effect(model = diamond_lm3,
         data = traing_data,
         focus_var_raw = c('cut'),
         focus_var_model = 'cut'
         )
  )

# __________________  Double Dimensions ____________________

# here focus_var_raw has two values: "carat" and "cut"
# that means we will evaluate impact of "carat" on "price" through different value of "cut"

effect(model = diamond_lm3,data = traing_data, focus_var_raw=c('carat',"cut"))

# __________________  Provide Values to Focused vars  ____________________

# when evaluating impacts,
# we can provide the range of values for key variables

effect(model = diamond_lm3,data = traing_data,
       focus_var_raw = c('carat',"cut"),
       focus_value = list(carat=seq(0.5,6,0.1)))




