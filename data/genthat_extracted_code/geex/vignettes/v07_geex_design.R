## ------------------------------------------------------------------------
library(geex)
library(dplyr)

myee <- function(data){
  Y1 <- data$Y1
  function(theta){
    c(Y1 - theta[1],
      (Y1 - theta[1])^2 - theta[2])
  }
}

## ------------------------------------------------------------------------
mybasis <- new("m_estimation_basis",
               .estFUN = myee,
               .data   = geexex)

## ------------------------------------------------------------------------
slotNames(mybasis)

## ------------------------------------------------------------------------
mybasis@.psiFUN_list[1:2]

## ---- eval=FALSE---------------------------------------------------------
#  m <- nrow(geexex)
#  lapply(split(geexex, f = 1:m), function(O_i){
#    myee(O_i)
#  })

## ------------------------------------------------------------------------
mybasis@.GFUN

## ------------------------------------------------------------------------
rootSolve::multiroot(
  f = mybasis@.GFUN, 
  start = c(0, 0))

## ----setup---------------------------------------------------------------
mycontrol <- new('geex_control', .root = setup_root_control(start = c(1, 1)))
mybasis@.control <- mycontrol
roots <- mybasis %>%
  estimate_GFUN_roots()
roots

## ------------------------------------------------------------------------
-numDeriv::jacobian(func = mybasis@.psiFUN_list[[1]], x = roots$root)

## ------------------------------------------------------------------------
mats <- mybasis %>%
  estimate_sandwich_matrices(.theta = roots$root) 

# Compare to the numDeriv computation above
grab_bread_list(mats)[[1]]

## ------------------------------------------------------------------------
mats %>%
  {compute_sigma(A = grab_bread(.), B = grab_meat(.))}

## ------------------------------------------------------------------------
m_estimate(
  estFUN = myee,
  data   = geexex,
  root_control = setup_root_control(start = c(0, 0))
)


