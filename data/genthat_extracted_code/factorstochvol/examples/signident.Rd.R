library(factorstochvol)


### Name: signident
### Title: A posteriori sign identification
### Aliases: signident

### ** Examples

## Not run: 
##D set.seed(1)
##D sim <- fsvsim(series = 8, factors = 2) # simulate 
##D res <- fsvsample(sim$y, factors = 2, signswitch = TRUE,
##D                  draws = 2000, burnin = 1000) # estimate
##D 
##D # Plot unidentified loadings:
##D facloaddensplot(res, fsvsimobj = sim, rows = 8)
##D 
##D # Identify:
##D res <- signident(res)
##D 
##D # Plot identified loadings:
##D facloaddensplot(res, fsvsimobj = sim, rows = 8)
## End(Not run)




