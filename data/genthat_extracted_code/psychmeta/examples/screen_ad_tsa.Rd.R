library(psychmeta)


### Name: screen_ad_tsa
### Title: Screen to detect invalid Taylor series artifact distribution
###   objects
### Aliases: screen_ad_tsa
### Keywords: internal

### ** Examples

## Not run
## ad_obj_int <- create_ad_int(rxxa = c(.9, .8), wt_rxxa = c(50, 150),
##                                 rxxi = c(.8, .7), wt_rxxi = c(50, 150),
##                                 ux = c(.9, .8), wt_ux = c(50, 150),
##                                 ut = c(.8, .7), wt_ut = c(50, 150))
##
## ad_obj_tsa <- create_ad_tsa(rxxa = c(.9, .8), n_rxxa = c(50, 150),
##                                 rxxi = c(.8, .7), n_rxxi = c(50, 150),
##                                 ux = c(.9, .8), ni_ux = c(50, 150),
##                                 ut = c(.8, .7), ni_ut = c(50, 150))
##
## screen_ad_tsa(x = ad_obj_tsa)
## screen_ad_tsa(x = ad_obj_int)
## screen_ad_tsa(x = data.frame(Value = 1, Weight = 1))



