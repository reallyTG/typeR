library(pipeliner)


### Name: transform_features
### Title: Transform machine learning feature variables
### Aliases: transform_features

### ** Examples

data <- head(faithful)
f <- transform_features(function(df) {
  data.frame(x1 = (df$waiting - mean(df$waiting)) / sd(df$waiting))
})

f(data)
#    eruptions waiting         x1
#  1     3.600      79  0.8324308
#  2     1.800      54 -1.0885633
#  3     3.333      74  0.4482320
#  4     2.283      62 -0.4738452
#  5     4.533      85  1.2934694
#  6     2.883      55 -1.0117236



