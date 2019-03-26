library(HMP)


### Name: Dirichlet.multinomial
### Title: Generation of Dirichlet-Multinomial Random Samples
### Aliases: Dirichlet.multinomial

### ** Examples

	data(saliva)
	
	### Generate a the number of reads per sample
	### The first number is the number of reads and the second is the number of subjects
	nrs <- rep(15000, 20) 
	
	### Get gamma from the dirichlet-multinomial parameters
	shape <- dirmult(saliva)$gamma
	
	dmData <- Dirichlet.multinomial(nrs, shape)
	dmData[1:5, 1:5]



