library(MTSYS)


### Name: MTA
### Title: Function to generate a unit space for the Mahalanobis-Taguchi
###   Adjoint (MTA) method
### Aliases: MTA

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

unit_space_MTA <- MTA(unit_space_data = iris_versicolor,
                      includes_transformed_data = TRUE)

(unit_space_MTA$distance)




