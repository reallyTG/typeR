library(tuckerR.mmgg)


### Name: matrition
### Title: Concatenate data frame in array and matrix by cases, variables
###   and environments
### Aliases: matrition

### ** Examples

data(maize_pop,package = "tuckerR.mmgg")
conc_matrix <- matrition(maize_pop,I=30,J=10,K=2)
conc_matrix$m  #get m array
conc_matrix$X1 #get matrix by cases
conc_matrix$X2 #get matrix by variables
conc_matrix$X3 #get matrix by environments



