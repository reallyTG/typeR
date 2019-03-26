library(jmv)


### Name: reliability
### Title: Reliability Analysis
### Aliases: reliability

### ** Examples

data('iris')

reliability(iris, vars = c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'),
            omegaScale = TRUE)

#
#  RELIABILITY ANALYSIS
#
#  Scale Reliability Statistics
#  -----------------------------------------
#             Cronbach's alpha    McDonald's omega
#  -----------------------------------------
#    scale           0.708           0.848
#  -----------------------------------------
#




