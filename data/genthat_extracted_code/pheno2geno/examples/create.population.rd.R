library(pheno2geno)


### Name: create.population
### Title: Create a population object
### Aliases: create.population population
### Keywords: manip

### ** Examples

	### simulating data
	population <- fake.population()
	offspring <- population$offspring$phenotypes
	founders <- population$founders$phenotypes
	founders_groups <- population$founders$groups
	population <- create.population(offspring,founders,founders_groups)



