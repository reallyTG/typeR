library(MTSYS)


### Name: general_diagnosis.MT
### Title: General function to implement a diagnosis method for a family of
###   Mahalanobis-Taguchi (MT) methods
### Aliases: general_diagnosis.MT

### ** Examples

                          
# 40 data for versicolor in the iris dataset                            
iris_versicolor <- iris[61:100, -5] 

# The following settings are same as the MT method.                          
unit_space <- general_MT(unit_space_data = iris_versicolor, 
                         generates_transform_function = 
                                            generates_normalization_function,
                         calc_A = function(x) solve(cor(x)),  
                         includes_transformed_data = TRUE)

# 10 data for each kind (setosa, versicolor, virginica) in the iris dataset                         
iris_test <- iris[c(1:10, 51:60, 101:111), -5]
                         
diagnosis <- general_diagnosis.MT(unit_space = unit_space, 
                                  newdata = iris_test, 
                                  threshold = 4,
                                  includes_transformed_newdata = TRUE)
                              
(diagnosis$distance)
(diagnosis$le_threshold)                          




