library(NB)


### Name: NB.estimator
### Title: Maximum likelihood estimation of effective population size from
###   temporally-spaced genetic data
### Aliases: NB.estimator

### ** Examples

## CREATE SAMPLE DATASET
NB.example.dataset()

## RUN THE FUNCTION
NB.estimator(infile='sample_data.txt', alleles=rep(4, 50), 
	sample.interval=c(0, 8), profile.likelihood=FALSE)

	#####
	## NUMERICAL RESULTS
	#$N
	# [1] 1241.079
	#
	#$CI
	#[1]  594.195 6375.933
	#
	#$log.like
	#[1] -543.9159
	#####



