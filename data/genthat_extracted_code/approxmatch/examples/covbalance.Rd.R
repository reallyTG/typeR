library(approxmatch)


### Name: covbalance
### Title: Check covariate balance of a design.
### Aliases: covbalance
### Keywords: covariate balance

### ** Examples

	## Don't show: 
	data(Dodgeram)
	
	grouplabel = 2*Dodgeram$WITHSABS + 1*Dodgeram$NOSAB + 3*Dodgeram$optSAB
	## An example strata structure
	matches = as.matrix(sample(rownames(Dodgeram), 500), ncol = 5)
	
	vars = c("AGE", "SEX.2", "IMPACT3.3", "DR_DRINK")
	details = c('std_diff')
	
	covbalance(.data=Dodgeram, grouplabel=grouplabel, 
	                 matches = matches, vars = vars, details) 
## End(Don't show)
	data(Dodgeram)
	
	## An example strata structure
	matches = as.matrix(sample(rownames(Dodgeram), 500), ncol = 5)
	
	vars = c("AGE", "SEX.2", "IMPACT3.3", "DR_DRINK")
	details = c('std_diff', 'mean', 'function(x) diff(range(x))', 
	                         'function(x) quantile(x, probs = .9)')
	names(details) <- c('std_diff', 'mean', 'range', '90perc')
	
	covbalance(.data=Dodgeram, grouplabel=c("NOSAB", "optSAB", "WITHSABS"), 
	                 matches = matches, vars = vars, details)
					 



