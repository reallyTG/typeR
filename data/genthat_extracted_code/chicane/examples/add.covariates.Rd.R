library(chicane)


### Name: add.covariates
### Title: add.covariates
### Aliases: add.covariates

### ** Examples

	data(bre80);
input.cols <- c('bait.id', 'target.id', 'bait.chr', 'bait.start', 
	'bait.end', 'target.chr', 'target.start', 'target.end', 'count');
output <- add.covariates(bre80[, input.cols, with = FALSE]);




