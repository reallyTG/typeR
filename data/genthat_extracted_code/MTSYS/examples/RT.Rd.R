library(MTSYS)


### Name: RT
### Title: Function to generate a unit space for the Recognition-Taguchi
###   (RT) method
### Aliases: RT

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

unit_space_RT <- RT(unit_space_data = iris_versicolor,
                    includes_transformed_data = TRUE)

# The following "tol" is a parameter passed to the solve function.
unit_space_RT <- RT(unit_space_data = iris_versicolor,
                    includes_transformed_data = TRUE,
                    tol = 1e-9)

(unit_space_RT$distance)




