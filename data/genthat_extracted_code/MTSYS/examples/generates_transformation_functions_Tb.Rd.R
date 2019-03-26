library(MTSYS)


### Name: generates_transformation_functions_Tb
### Title: Function to generate data transformation functions for the Tb
###   methods
### Aliases: generates_transformation_functions_Tb

### ** Examples

# The value of the dependent variable of the following samples mediates  
# in the stackloss dataset.
stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ] 
    
tmp <- generates_transformation_functions_Tb(stackloss_center)
center_subtraction_function <- tmp[[1]]
subtracts_ys <- tmp[[2]]
adds_M_0 <- tmp[[3]] 

is.function(center_subtraction_function) # TRUE
is.function(subtracts_ys) # TRUE
is.function(adds_M_0) # TRUE




