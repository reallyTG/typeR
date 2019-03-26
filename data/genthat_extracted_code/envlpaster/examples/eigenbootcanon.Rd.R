library(envlpaster)


### Name: eigenbootcanon
### Title: eigenbootcanon
### Aliases: eigenbootcanon

### ** Examples

## Not run: 
##D set.seed(13)
##D library(envlpaster)
##D library(aster2)
##D data(generateddata)
##D m1 <- aster(resp ~ 0 + varb + mass + timing, 
##D   fam = fam, pred = pred, varvar = varb, idvar = id,
##D   root = root, data = redata)
##D target <- c(9:10)
##D nboot <- 2000; timer <- nboot/2
##D bar <- eigenbootcanon(m1, nboot = nboot, index = target,
##D   vectors = c(2), u = 1, m = timer)
##D bar
## End(Not run)



