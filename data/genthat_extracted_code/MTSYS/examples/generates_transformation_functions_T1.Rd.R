library(MTSYS)


### Name: generates_transformation_functions_T1
### Title: Function to generate data transformation functions for the T1
###   methods
### Aliases: generates_transformation_functions_T1

### ** Examples

   
# The value of the dependent variable of the following samples mediates  
# in the stackloss dataset.
stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ] 
      
tmp <- generates_transformation_functions_T1(stackloss_center)
mean_subtraction_function <- tmp[[1]]
subtracts_M_0 <- tmp[[2]]
adds_M_0 <- tmp[[3]] 

is.function(mean_subtraction_function) # TRUE
is.function(subtracts_M_0) # TRUE
is.function(adds_M_0) # TRUE




