library(pheno2geno)


### Name: generate.biomarkers
### Title: Generate discrete biomarkers from the continuous phenotypes
### Aliases: generate.biomarkers overlapInd proportion margin
### Keywords: manip

### ** Examples

	#Example for F2 population
	set.seed(102)
	population <- fake.population(type="f2")
	population <- find.diff.expressed(population)
	population <- generate.biomarkers(population,proportion=c(25,50,25),threshold=0.01)
	## Not run: 
##D 	#Example for BC population
##D 	set.seed(102)
##D 	population <- fake.population(type="bc")
##D 	population <- find.diff.expressed(population)
##D 	population <- generate.biomarkers(population,proportion=c(25,75),threshold=0.01)
##D 
##D 	#Example for BC population
##D 	set.seed(102)
##D 	population <- fake.population(type="riself")
##D 	population <- find.diff.expressed(population)
##D 	population <- generate.biomarkers(population,proportion=c(50,50),threshold=0.01)
##D 	
## End(Not run)



