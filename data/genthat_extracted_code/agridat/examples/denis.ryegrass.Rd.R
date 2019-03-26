library(agridat)


### Name: denis.ryegrass
### Title: Multi-environment trial of perennial ryegrass in France
### Aliases: denis.ryegrass
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D library(agridat)
##D data(denis.ryegrass)
##D dat <- denis.ryegrass
##D 
##D # biplots (without ellipses) similar to Denis figure 1
##D require(gge)
##D m1 <- gge(strength ~ gen*loc, dat, scale=FALSE)
##D biplot(m1, main="denis.ryegrass biplot")
##D 
## End(Not run)



