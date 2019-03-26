library(scales)


### Name: math_format
### Title: Add arbitrary expression to a label. The symbol that will be
###   replace by the label value is '.x'.
### Aliases: math_format

### ** Examples

math_format()(1:10)
math_format(alpha + frac(1, .x))(1:10)
math_format()(runif(10))
math_format(format = percent)(runif(10))



