library(ACMEeqtl)


### Name: create_artificial_data
### Title: Create an Artificial eQTL Data Set
### Aliases: create_artificial_data

### ** Examples

z = create_artificial_data(
		nsample = 10,
		ngene = 51,
		nsnp = 501,
		ncvrt = 1,
		minMAF = 0.2,
		returnData = TRUE,
		savefmat = FALSE,
		savetxt = FALSE,
		verbose = TRUE)
    
names(z)



