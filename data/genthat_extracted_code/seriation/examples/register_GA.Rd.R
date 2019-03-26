library(seriation)


### Name: register_GA
### Title: Register a Genetic Algorithm Seriation Method
### Aliases: register_GA GA ga gaperm_mixedMutation
### Keywords: optimize cluster

### ** Examples

## Not run: 
##D register_GA()
##D list_seriation_methods("dist")
##D 
##D d <- dist(random.robinson(50, pre=TRUE, noise=.1))
##D 
##D ## use default settings: Banded AR form
##D o <- seriate(d, "GA")
##D pimage(d, o)
##D 
##D ## optimize for linear sertiation criterion (LS)
##D o <- seriate(d, "GA", control = list(criterion = "LS"))
##D pimage(d, o)
##D 
##D ## no warm start
##D o <- seriate(d, "GA", control = list(criterion = "LS", suggestions = NA))
##D pimage(d, o)
## End(Not run)



