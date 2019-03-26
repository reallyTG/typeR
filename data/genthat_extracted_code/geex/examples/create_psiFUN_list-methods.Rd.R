library(geex)


### Name: create_psiFUN_list
### Title: Creates list of psi functions
### Aliases: create_psiFUN_list
###   create_psiFUN_list,m_estimation_basis-method
###   create_psiFUN_list,m_estimation_basis,m_estimation_basis-method

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
psi_list <- grab_psiFUN_list(create_psiFUN_list(mybasis))

# A list of functions
head(psi_list)



