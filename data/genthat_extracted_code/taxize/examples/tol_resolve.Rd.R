library(taxize)


### Name: tol_resolve
### Title: Resolve names using Open Tree of Life (OTL) resolver
### Aliases: tol_resolve
### Keywords: names resolve taxonomy

### ** Examples

## Not run: 
##D tol_resolve(names=c("echinodermata", "xenacoelomorpha",
##D   "chordata", "hemichordata"))
##D tol_resolve(c("Hyla", "Salmo", "Diadema", "Nautilus"))
##D tol_resolve(c("Hyla", "Salmo", "Diadema", "Nautilus"),
##D   context_name = "Animals")
##D 
##D turducken_spp <- c("Meleagris gallopavo", "Anas platyrhynchos",
##D   "Gallus gallus")
##D tol_resolve(turducken_spp, context_name="Animals")
## End(Not run)



