library(dae)


### Name: no.reps
### Title: Computes the number of replicates for an experiment
### Aliases: no.reps
### Keywords: design

### ** Examples

## Compute the number of replicates (blocks) required for a randomized 
## complete block design with four treatments. 
no.reps(multiple = 1, df.num = 3,
        df.denom = expression(df.num * (r - 1)), delta = 5,
	        sigma = sqrt(20), print = TRUE)



