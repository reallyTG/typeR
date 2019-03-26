library(mvbutils)


### Name: foodweb
### Title: Shows which functions call what
### Aliases: foodweb callers.of callees.of plot.foodweb
### Keywords: misc

### ** Examples

foodweb( ) # functions in .GlobalEnv
# I have had to trim this set of examples because CRAN thinks it's too slow...
# ... though it's only 5sec on my humble laptop. So...
## Not run: 
##D foodweb( where="package:mvbutils", cex=0.4, charlim=60) # yikes!
##D foodweb( c( find.funs("package:mvbutils"), "paste"))
##D # functions in .GlobalEnv, and "paste"
##D foodweb( find.funs("package:mvbutils"), prune="paste")
##D # only those parts of the tree connected to "paste";
##D # NB that funs <- unique( c( funs, prune)) inside "foodweb"
##D foodweb( where="package:mvbutils", rprune="aste")
##D # doesn't include "paste" as it's not in "mvbutils", and rprune doesn't augment funs
##D foodweb( where=asNamespace( "mvbutils")) # secret stuff
##D fw <- foodweb( where="package:mvbutils")
## End(Not run)
fw <- foodweb( where=asNamespace( "mvbutils")) # also plots
fw$funmat # a big matrix
callers.of( "mlocal", fw)
callees.of( "find.funs", fw)
# ie only descs of functions whose name contains 'name'
foodweb( where=asNamespace( 'mvbutils'), rprune="name", ancestors=FALSE, descendents=TRUE)



