library(geex)


### Name: create_basis
### Title: Creates an m_estimation_basis object
### Aliases: create_basis

### ** Examples

myee <- function(data){
   function(theta){
    c(data$Y1 - theta[1],
     (data$Y1 - theta[1])^2 - theta[2])
   }
 }
mybasis <- create_basis(
   estFUN = myee,
   data   = geexex)



