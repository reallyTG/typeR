library(jmv)


### Name: pca
### Title: Principal Component Analysis
### Aliases: pca

### ** Examples

data('iris')

pca(iris, vars = vars(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width))

#
#  PRINCIPAL COMPONENT ANALYSIS
#
#  Component Loadings
#  ----------------------------------------
#                    1         Uniqueness
#  ----------------------------------------
#    Sepal.Length     0.890        0.2076
#    Sepal.Width     -0.460        0.7883
#    Petal.Length     0.992        0.0168
#    Petal.Width      0.965        0.0688
#  ----------------------------------------
#    Note. 'varimax' rotation was used
#




