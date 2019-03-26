library(MTSYS)


### Name: generates_dimensionality_reduction_function
### Title: Function to generate a data transformation function for the
###   Recognition-Taguchi (RT) method
### Aliases: generates_dimensionality_reduction_function

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

reduces_dimensionality <-
                 generates_dimensionality_reduction_function(iris_versicolor)

is.function(reduces_dimensionality) # TRUE




