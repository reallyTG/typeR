## ---- echo = FALSE, message = FALSE, warning=FALSE-----------------------
library(geex)

## ----SB6_estFUN, echo = TRUE---------------------------------------------
myefun <- function(data, k = 1.5){
  function(theta){
    x <- data$Y1 - theta[1]
    if(abs(x) <= k) x else sign(x) * k
  }
}

## ----multiroot_example, echo = TRUE, message=FALSE-----------------------
multiroot_results <- m_estimate(
  estFUN = myefun, 
  data  = geexex,
  root_control = setup_root_control(start = 3))

## ----uniroot_example, echo = TRUE, message=FALSE-------------------------
uniroot_results <- m_estimate(
  estFUN = myefun, 
  data  = geexex,
  root_control = setup_root_control(stats::uniroot, interval = c(0, 10)))

## ----compare_results-----------------------------------------------------
roots(multiroot_results) - roots(uniroot_results)

