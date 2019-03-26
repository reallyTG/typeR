library(CLME)


### Name: plot.summary.clme
### Title: S3 method to plot objects of class 'clme'
### Aliases: plot.summary.clme

### ** Examples

## Not run: 
##D   set.seed( 42 )
##D   data( rat.blood )
##D   cons <- list(order = "simple", decreasing = FALSE, node = 1 )
##D   clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
##D                    constraints = cons, seed = 42, nsim = 10)
##D   clme.out2 <- summary( clme.out )
##D   plot( clme.out2 )
## End(Not run)





