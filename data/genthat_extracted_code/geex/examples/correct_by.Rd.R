library(geex)


### Name: correct_by
### Title: Correct sandwich components
### Aliases: correct_by

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
mats <- estimate_sandwich_matrices(mybasis, .theta = c(5.04, 10.04))
correct_by(mats,
   .correct_control =  correction(fay_bias_correction, b = .75))



