library(CLME)


### Name: plot.clme
### Title: S3 method to plot objects of class 'clme'
### Aliases: plot.clme

### ** Examples

## Not run: 
##D   set.seed( 42 )
##D   data( rat.blood )
##D   cons <- list(order = "simple", decreasing = FALSE, node = 1 )
##D   clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
##D                    constraints = cons, seed = 42, nsim = 10)
##D   plot( clme.out )
## End(Not run)




