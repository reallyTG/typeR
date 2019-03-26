library(geex)


### Name: vcov,geex-method
### Title: Gets the variance-covariance matrix from a geex object
### Aliases: vcov,geex-method vcov,geex,geex-method
###   vcov,geex_summary-method vcov,geex_summary,geex_summary-method

### ** Examples

ex_eeFUN <- function(data){
 function(theta){
   with(data,
    c(Y1 - theta[1],
     (Y1 - theta[1])^2 - theta[2] ))
}}

results <- m_estimate(
 estFUN = ex_eeFUN,
 data  = geexex,
 root_control = setup_root_control(start = c(1,1)))

vcov(results)



