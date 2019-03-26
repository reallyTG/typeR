library(geex)


### Name: fay_df_correction
### Title: Correct sandwich variance inference by Fay's degrees of freedom
###   correction
### Aliases: fay_df_correction

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
     df_correction1 = correction(fay_df_correction,
                        b = .75, L = c(0, 1), version = 1 ),
     df_correction2 = correction(fay_df_correction,
                        b = .75, L = c(0, 1), version = 2 ))
   )

get_corrections(results)



