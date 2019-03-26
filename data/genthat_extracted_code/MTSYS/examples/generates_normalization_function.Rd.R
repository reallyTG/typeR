library(MTSYS)


### Name: generates_normalization_function
### Title: Function to generate the data normalization function
### Aliases: generates_normalization_function

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

normalizes_data <- generates_normalization_function(iris_versicolor)

is.function(normalizes_data) # TRUE




