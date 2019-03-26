library(pheno2geno)


### Name: read.population
### Title: Loading genotype and phenotype data
### Aliases: read.population
### Keywords: manip

### ** Examples

  ## Not run: 
##D   ### simplest call possible
##D   population <- read.population(founders_groups=c(0,0,0,1,1,1))
##D   ### more informative one
##D   population <- read.population(founders_groups=c(0,0,0,1,1,1),verbose=TRUE,debugMode=1)
##D   ### imagine you prefer parents and children instead of founders and offspring:
##D   population <- read.population(offspring="children",founders="parents",
##D     founders_groups=c(0,0,0,1,1,1),verbose=TRUE,debugMode=1)
##D   ### etc.. when you load it, you may want to inspect it:
##D   population$founders$phenotypes[1:10,]
##D   
## End(Not run)



