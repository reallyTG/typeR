library(subselect)


### Name: trim.matrix
### Title: Given an ill-conditioned square matrix, deletes rows/columns
###   until a well-conditioned submatrix is obtained.
### Aliases: trim.matrix
### Keywords: manip

### ** Examples


# a trivial example, for illustration of use: creating an extra column,
# as the sum of columns in the "iris" data, and then using the function
# trim.matrix to exclude it from the data's correlation matrix

data(iris)
lindepir<-cbind(apply(iris[,-5],1,sum),iris[,-5])
colnames(lindepir)[1]<-"Sum"
cor(lindepir)

##                    Sum Sepal.Length Sepal.Width Petal.Length Petal.Width
##Sum           1.0000000    0.9409143  -0.2230928    0.9713793   0.9538850
##Sepal.Length  0.9409143    1.0000000  -0.1175698    0.8717538   0.8179411
##Sepal.Width  -0.2230928   -0.1175698   1.0000000   -0.4284401  -0.3661259
##Petal.Length  0.9713793    0.8717538  -0.4284401    1.0000000   0.9628654
##Petal.Width   0.9538850    0.8179411  -0.3661259    0.9628654   1.0000000

trim.matrix(cor(lindepir))

##$trimmedmat
##             Sepal.Length Sepal.Width Petal.Length Petal.Width
##Sepal.Length    1.0000000  -0.1175698    0.8717538   0.8179411
##Sepal.Width    -0.1175698   1.0000000   -0.4284401  -0.3661259
##Petal.Length    0.8717538  -0.4284401    1.0000000   0.9628654
##Petal.Width     0.8179411  -0.3661259    0.9628654   1.0000000
##
##$numbers.discarded
##[1] 1
##
##$names.discarded
##[1] "Sum"
##
##$size
##[1] 4

data(swiss)
lindepsw<-cbind(apply(swiss,1,sum),swiss)
colnames(lindepsw)[1]<-"Sum"
trim.matrix(cor(lindepsw))

##$lowrankmat
##                  Fertility Agriculture examination   Education   Catholic
##Fertility         1.0000000  0.35307918  -0.6458827 -0.66378886  0.4636847
##Agriculture       0.3530792  1.00000000  -0.6865422 -0.63952252  0.4010951
##Examination      -0.6458827 -0.68654221   1.0000000  0.69841530 -0.5727418
##Education        -0.6637889 -0.63952252   0.6984153  1.00000000 -0.1538589
##Catholic          0.4636847  0.40109505  -0.5727418 -0.15385892  1.0000000
##Infant.Mortality  0.4165560 -0.06085861  -0.1140216 -0.09932185  0.1754959
##                 Infant.Mortality
##Fertility              0.41655603
##Agriculture           -0.06085861
##Examination           -0.11402160
##Education             -0.09932185
##Catholic               0.17549591
##Infant.Mortality       1.00000000
##
##$numbers.discarded
##[1] 1
##
##$names.discarded
##[1] "Sum"
##
##$size
##[1] 6




