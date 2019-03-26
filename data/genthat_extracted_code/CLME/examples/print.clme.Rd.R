library(CLME)


### Name: print.clme
### Title: Printout of fitted object.
### Aliases: print.clme

### ** Examples

## Not run: 
##D data( rat.blood )
##D set.seed( 42 )
##D cons <- list(order = "simple", decreasing = FALSE, node = 1 )
##D clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
##D                  constraints = cons, seed = 42, nsim = 10)
##D 
##D print( clme.out )
## End(Not run)




