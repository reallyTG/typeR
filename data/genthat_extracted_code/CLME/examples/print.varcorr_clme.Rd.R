library(CLME)


### Name: print.varcorr_clme
### Title: Printout for variance components
### Aliases: print.varcorr_clme

### ** Examples

## Not run: 
##D data( rat.blood )
##D cons <- list(order = "simple", decreasing = FALSE, node = 1 )
##D clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
##D                  constraints = cons, seed = 42, nsim = 0)
##D                  
##D print.varcorr_clme( clme.out )
## End(Not run)



