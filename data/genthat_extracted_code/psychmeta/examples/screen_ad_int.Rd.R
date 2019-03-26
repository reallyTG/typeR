library(psychmeta)


### Name: screen_ad_int
### Title: Screen to detect invalid interactive artifact distribution
###   objects
### Aliases: screen_ad_int
### Keywords: internal

### ** Examples

## Not run: 
##D ad_obj_int <- create_ad_int(rxxa = c(.9, .8), wt_rxxa = c(50, 150),
##D                             rxxi = c(.8, .7), wt_rxxi = c(50, 150),
##D                             ux = c(.9, .8), wt_ux = c(50, 150),
##D                             ut = c(.8, .7), wt_ut = c(50, 150))
##D 
##D ad_obj_tsa <- create_ad_tsa(rxxa = c(.9, .8), n_rxxa = c(50, 150),
##D                             rxxi = c(.8, .7), n_rxxi = c(50, 150),
##D                             ux = c(.9, .8), ni_ux = c(50, 150),
##D                             ut = c(.8, .7), ni_ut = c(50, 150))
##D 
##D screen_ad_int(x = ad_obj_int)
##D screen_ad_int(x = ad_obj_tsa)
##D screen_ad_int(x = data.frame(Value = 1, Weight = 1))
## End(Not run)



