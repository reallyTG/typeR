library(EpiModel)


### Name: update_dissolution
### Title: Adjust Dissolution Component of Network Model Fit
### Aliases: update_dissolution

### ** Examples

## Not run: 
##D nw <- network.initialize(1000, directed = FALSE)
##D 
##D # Two dissolutions: an average duration of 300 versus 200
##D diss.300 <- dissolution_coefs(~offset(edges), 300, 0.001)
##D diss.200 <- dissolution_coefs(~offset(edges), 200, 0.001)
##D 
##D # Fit the two reference models
##D est300 <- netest(nw = nw,
##D                 formation = ~edges,
##D                 target.stats = c(500),
##D                 coef.diss = diss.300)
##D 
##D est200 <- netest(nw = nw,
##D                 formation = ~edges,
##D                 target.stats = c(500),
##D                 coef.diss = diss.200)
##D 
##D # Alternatively, update the 300 model with the 200 coefficients
##D est200.compare <- update_dissolution(est300, diss.200)
##D 
##D identical(est200$coef.form, est200.compare$coef.form)
## End(Not run)




