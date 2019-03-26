library(fSRM)


### Name: plot.fSRM
### Title: Plot an fSRM-object, two types
### Aliases: plot.fSRM

### ** Examples

## Not run: 
##D data(two.indicators)
##D # 4 persons, 1 indicator
##D f4.1 <- fSRM(dep1 ~ actor.id*partner.id | family.id, two.indicators, means=TRUE)
##D f4.1
##D plot(f4.1)
##D plot(f4.1, bw=TRUE)
##D plot(f4.1, means=TRUE)
##D 
##D # 4 persons, 2 indicators
##D f4.2 <- fSRM(dep1/dep2 ~ actor.id*partner.id | family.id, two.indicators, means=TRUE)
##D f4.2
##D plot(f4.2)
##D plot(f4.2, bw=TRUE)
##D plot(f4.2, means=TRUE)
## End(Not run)



