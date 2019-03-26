library(geex)


### Name: get_corrections
### Title: Gets the corrections from a geex object
### Aliases: get_corrections get_corrections,geex-method
###   get_corrections,m_estimation_basis,m_estimation_basis-method
###   get_corrections,geex_summary-method

### ** Examples

myee <- function(data){
 function(theta){
   c(data$Y1 - theta[1],
   (data$Y1 - theta[1])^2 - theta[2])
  }
}

results <- m_estimate(
   estFUN = myee,
   data = geexex,
   root_control = setup_root_control(start = c(1,1)),
   corrections  = list(
     bias_correction_.1 = correction(fay_bias_correction, b = .1),
     bias_correction_.3 = correction(fay_bias_correction, b = .3))
   )

get_corrections(results)



