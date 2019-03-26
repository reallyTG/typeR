library(MTSYS)


### Name: general_MT
### Title: General function to generate a unit space for a family of
###   Mahalanobis-Taguchi (MT) methods
### Aliases: general_MT

### ** Examples

# 40 data for versicolor in the iris dataset                            
iris_versicolor <- iris[61:100, -5] 

# The following settings are same as the MT method.                          
unit_space <- general_MT(unit_space_data = iris_versicolor, 
                         generates_transform_function = 
                                            generates_normalization_function,
                         calc_A = function(x) solve(cor(x)),  
                         includes_transformed_data = TRUE)
                         
(unit_space$distance)




