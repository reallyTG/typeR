library(NB)


### Name: NB.likelihood
### Title: Log-likelihood values for the NB estimator
### Aliases: NB.likelihood

### ** Examples

## CREATE SAMPLE DATASET
NB.example.dataset()

##SEE WHAT'S THE LOG-LIKELIHOOD VALUE IS WHEN N=1000
NB.likelihood(N=1000, infile='sample_data.txt', 
	alleles=rep(4, 50), sample.interval=c(0, 8))

	#####
	# NUMERICAL RESULT
	#[1] -544.0405
	#####




