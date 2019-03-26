
 library(TSHRC)
 data(rats)

 options(digits=4) # avoid rounding differences

 set.seed(42)
 twostage(rats$time, rats$delta, rats$group, nboot = 1e3)

