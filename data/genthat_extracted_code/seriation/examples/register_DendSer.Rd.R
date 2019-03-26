library(seriation)


### Name: register_DendSer
### Title: Register Seriation Methods from Package DendSer
### Aliases: register_DendSer DendSer dendser
### Keywords: optimize cluster

### ** Examples

## Not run: 
##D register_DendSer()
##D list_seriation_methods("dist")
##D 
##D d <- dist(random.robinson(20, pre=TRUE))
##D 
##D ## use Banded AR form with default clustering (complete-link)
##D o <- seriate(d, "DendSer_BAR")
##D pimage(d, o)
##D 
##D ## use different hclust method (Ward) and AR as the cost function for
##D ## dendrogram reordering
##D o <- seriate(d, "DendSer", control = list(method = "ward.D2", criterion = "AR"))
##D pimage(d, o)
## End(Not run)



