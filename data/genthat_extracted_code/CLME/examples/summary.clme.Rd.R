library(CLME)


### Name: summary.clme
### Title: Produce summary values for objects of class 'clme'
### Aliases: summary.clme

### ** Examples

## Not run: 
##D   set.seed( 42 )
##D   data( rat.blood )
##D   cons <- list(order = "simple", decreasing = FALSE, node = 1 )
##D   clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
##D                    constraints = cons, seed = 42, nsim = 10)
##D   
##D   summary( clme.out )
## End(Not run)





