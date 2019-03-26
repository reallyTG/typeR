library(costat)


### Name: extractCS
### Title: Extractor function for 'csFSS' object.
### Aliases: extractCS
### Keywords: ts

### ** Examples

#
# Create dummy data
#
x1 <- rnorm(32)
y1 <- rnorm(32)
#
# Find stationary combinations
# Note: we don't run this example in installation/package formation as
# it takes a long time. However, this precise command IS run in
# the help to findstysols
#
## Not run: ans <- findstysols(Nsims=100, tsx=x1, tsy=y1)
#
# Get the optimal (endpar) alphas for the first 10 solutions
#
## Not run: extractCS(ans, slot="endpar", coeftype="alpha", solno=1:10)
#
# Plot the beta_t associate with the optimal solution for solution 29
#
## Not run: 
##D ts.plot(extractCS(ans, slot="endpar", coeftype="betafunc",
##D 	solno=29))
## End(Not run)
#
# Get the p-value associated with solution 29
#
## Not run: extractCS(ans, slot="pvals", solno=29)



