library(geex)


### Name: roots
### Title: Gets the parameter estimates matrix from a geex object
### Aliases: roots roots,geex-method roots,geex,geex-method
###   roots,geex_summary-method roots,geex,geex-method

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

roots(results)



