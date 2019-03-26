library(pipeliner)


### Name: transform_response
### Title: Transform machine learning response variable
### Aliases: transform_response

### ** Examples

data <- head(faithful)
f <- transform_response(function(df) {
  data.frame(y = (df$eruptions - mean(df$eruptions)) / sd(df$eruptions))
})

f(data)
#   eruptions waiting         y
# 1     3.600      79  0.5412808
# 2     1.800      54 -1.3039946
# 3     3.333      74  0.2675649
# 4     2.283      62 -0.8088457
# 5     4.533      85  1.4977485
# 6     2.883      55 -0.1937539



