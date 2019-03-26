library(SimDesign)


### Name: subset.SimDesign
### Title: Subset method for SimDesign objects
### Aliases: subset.SimDesign

### ** Examples

## Not run: 
##D data("BF_sim")
##D x <- subset(BF_sim, select = 1:6)
##D attributes(x)
##D head(x)
##D 
##D x1 <- subset(BF_sim, select = c(1,2,4,5,10))
##D attributes(x1)
##D 
##D x2 <- subset(BF_sim, select = var_ratio:alpha.05.Jacknife)
##D attributes(x2)
##D 
##D x3 <- subset(BF_sim, var_ratio == 1)
##D dim(BF_sim)
##D dim(x3)
## End(Not run)




