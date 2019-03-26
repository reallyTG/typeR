library(CLME)


### Name: residuals.clme
### Title: Various types of residuals
### Aliases: residuals.clme residuals.summary.clme

### ** Examples

## Not run: 
##D data( rat.blood )
##D cons <- list(order = "simple", decreasing = FALSE, node = 1 )
##D clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
##D                  constraints = cons, seed = 42, nsim = 0)
##D                  
##D residuals( clme.out, type='PA' )
## End(Not run)



