library(bayesmeta)


### Name: Cochran1954
### Title: Fly counts example data
### Aliases: Cochran1954
### Keywords: datasets

### ** Examples

data("Cochran1954")
## Not run: 
##D # analysis using improper uniform prior
##D # (may take a few seconds to compute!):
##D bma <- bayesmeta(y=Cochran1954[,"mean"], sigma=sqrt(Cochran1954[,"se2"]),
##D                  label=Cochran1954[,"observer"])
##D 
##D # show joint posterior density:
##D plot(bma, which=2, main="Cochran example")
##D # show (known) true parameter value:
##D abline(h=161)
##D 
##D # show forest plot:
##D forestplot(bma, zero=161)
## End(Not run)



