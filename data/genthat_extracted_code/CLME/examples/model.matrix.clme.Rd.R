library(CLME)


### Name: model.matrix.clme
### Title: Extract the model design matrix.
### Aliases: model.matrix.clme model.matrix.summary.clme

### ** Examples

## Not run: 
##D data( rat.blood )
##D cons <- list(order = "simple", decreasing = FALSE, node = 1 )
##D clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
##D                  constraints = cons, seed = 42, nsim = 0)
##D 
##D model.matrix( clme.out )
## End(Not run)



