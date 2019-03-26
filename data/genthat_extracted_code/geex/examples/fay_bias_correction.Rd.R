library(geex)


### Name: fay_bias_correction
### Title: Correct sandwich variance estimator byFay's bias correction
### Aliases: fay_bias_correction

### ** Examples

# This example demonstrates usage of the corrections, not a meaningful application
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



