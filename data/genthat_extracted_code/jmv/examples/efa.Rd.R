library(jmv)


### Name: efa
### Title: Exploratory Factor Analysis
### Aliases: efa

### ** Examples

data('iris')

efa(iris, vars = vars(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width))

#
#  EXPLORATORY FACTOR ANALYSIS
#
#  Factor Loadings
#  ------------------------------------------------
#                    1        2        Uniqueness
#  ------------------------------------------------
#    Sepal.Length    0.993                0.10181
#    Sepal.Width              0.725       0.42199
#    Petal.Length    0.933                0.00483
#    Petal.Width     0.897                0.07088
#  ------------------------------------------------
#    Note. 'oblimin' rotation was used
#




