library(geex)


### Name: diagnose_roots
### Title: Diagnose roots of estimating equations
### Aliases: diagnose_roots

### ** Examples

myee <- function(data){
   function(theta){
    c(data$Y1 - theta[1],
     (data$Y1 - theta[1])^2 - theta[2])
   }
 }

mest <- m_estimate(
   estFUN = myee,
   data   = geexex,
   root_control = setup_root_control(start = c(1, 1)))

f <- grab_GFUN(mest@basis)
# Should be close to zero
diagnose_roots(GFUN = f, theta = roots(mest))



