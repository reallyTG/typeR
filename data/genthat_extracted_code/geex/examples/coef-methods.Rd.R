library(geex)


### Name: coef,geex-method
### Title: Gets the parameter estimates from a geex object
### Aliases: coef,geex-method coef,geex,geex-method
###   coef,geex_summary-method

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

coef(results)



