library(sfadv)


### Name: sfaendog
### Title: Stochastic frontier analysis with technical inefficiency effects
###   and endogeneity of one input
### Aliases: sfaendog
### Keywords: models

### ** Examples

## Not run: 
##D   y <- "farm_output"
##D   x.exo <- c("agri_land", "tot_lab", "tot_asset")
##D   x.endo <-  "costs"
##D   c.var <- c("LFA", "T", "I(T^2)")
##D   ineff <- c("hired_lab", "rented_land", "debt_asset", "subs", "region", "region:T")
##D   inst <- c("milkprice", "I(milkprice^2)", "price_ind", "milkprice:region")
##D   
##D   RES <- sfaendog(y, x.exo, x.endo, c.var, ineff, inst, data=Farms)
##D   
##D   summary(RES)
## End(Not run)



