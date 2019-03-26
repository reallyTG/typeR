library(NB)


### Name: NB.plot.likelihood
### Title: Plot profile (log)-likelihood
### Aliases: NB.plot.likelihood

### ** Examples

## CREATE SAMPLE DATASET
NB.example.dataset()

## PLOT THE LOG-LIKELIHOOD
NB.plot.likelihood(infile='sample_data.txt', alleles=rep(4, 50), 
	sample.interval=c(0, 8), lb=300, ub=2000, step=200)



