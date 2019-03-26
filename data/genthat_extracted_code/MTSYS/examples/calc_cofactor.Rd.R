library(MTSYS)


### Name: calc_cofactor
### Title: Function to calculate a cofactor matrix
### Aliases: calc_cofactor

### ** Examples

# 40 data for versicolor in the iris dataset                            
iris_versicolor <- iris[61:100, -5] 
                            
calc_cofactor(cov(iris_versicolor))
 



