library(pipeliner)


### Name: inv_transform_response
### Title: Inverse transform machine learning response variable
### Aliases: inv_transform_response

### ** Examples

data <- head(faithful)
f1 <- transform_response(function(df) {
  data.frame(y = (df$eruptions - mean(df$eruptions)) / sd(df$eruptions))
})
f2 <- inv_transform_response(function(df) {
  data.frame(eruptions2 = df$y * sd(df$eruptions) + mean(df$eruptions))
})

f2(f1(data))
#   eruptions waiting          y eruptions2
# 1     3.600      79  0.5412808      3.600
# 2     1.800      54 -1.3039946      1.800
# 3     3.333      74  0.2675649      3.333
# 4     2.283      62 -0.8088457      2.283
# 5     4.533      85  1.4977485      4.533
# 6     2.883      55 -0.1937539      2.883



