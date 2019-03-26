library(approxmatch)


### Name: kwaymatching
### Title: Create approximately optimal matched strata of multiple groups.
### Aliases: kwaymatching tripletmatching
### Keywords: matching design

### ** Examples
	
	## Don't show: 
	data(Dodgeram) # dodge ram pk 2500
	Dodgeram <- Dodgeram[sample(rownames(Dodgeram), 1000),]
	grouplabel = 2*Dodgeram$WITHSABS + 1*Dodgeram$NOSAB + 3*Dodgeram$optSAB
	
	# distance components consists of log propensity 
	# distance and rank based Mahalanobis distance.
	components <- list(prop = c("AGE", "IMPACT3"), mahal = c("SEX.2", "AGE", "FIRE_EXP1.1"))
	wgts <- c(10, 5)
	distmat <- multigrp_dist_struc(Dodgeram, grouplabel = grouplabel, components, wgts)	
## End(Don't show)
	
	## USAGE 1
	## Not run: 
##D 	library(optmatch)
##D 	## User is required to install and load the optmatch package separately,
##D 	
##D 	data(Dodgeram) # dodge ram pk 2500
##D 	
##D 	grouplabel = 2*Dodgeram$WITHSABS + 1*Dodgeram$NOSAB + 3*Dodgeram$optSAB
##D 	
##D 	# distance components consists of log propensity 
##D 	# distance and rank based Mahalanobis distance.
##D 	components <- list(prop = c("AGE", "IMPACT3"), mahal = c("SEX.2", "AGE", "FIRE_EXP1.1"))
##D 	wgts <- c(10, 5)
##D 	distmat <- multigrp_dist_struc(Dodgeram, grouplabel = grouplabel, components, wgts)	
##D 	
##D 	# Matching 
##D 	design = c(1,1,3) # 3 units from the optional period, 1 each from other periods
##D 	indexgroup = 2
##D 	res = tripletmatching(distmat = distmat, grouplabel = grouplabel, design = design, 
##D 	                            indexgroup = indexgroup)
##D 	
##D 	# covariance balance
##D 	details = 'mean'
##D 	covbalance(Dodgeram, grouplabel=c("NOSAB", "optSAB", "WITHSABS"), matches = res, 
##D 	                          vars = c("AGE", "SEX.2", "IMPACT3.3", "DR_DRINK"), details)
##D 	
## End(Not run)
	
	## USAGE 2
	## Not run: 
##D 	library(optmatch)
##D 	## User is required to install and load the optmatch package separately,
##D 	
##D 	data(Dodgeram)
##D 	
##D 	# Example distance structure
##D 	components <- list(prop = c("AGE", "SEX.2", "FR.pass", "REST_USE1", "ROLLOVER1",
##D 	            "IMPACT3", "SP_LIMIT", "DR_DRINK", "FIRE_EXP1.1"), 
##D 	            mahal = c("SEX.2", "AGE", "SP_LIMIT", "DR_DRINK"), 				
##D 	            mahal = c("IMPACT3", "REST_USE1"))
##D 	wgts <- c(5, 8, 20)
##D 	
##D 	distmat <- multigrp_dist_struc(Dodgeram, grouplabel = c("NOSAB", "optSAB", "WITHSABS"), 
##D 	                                   components, wgts)
##D 	
##D 	# Matching with fine balance and exact match
##D 	indexgroup = "WITHSABS"
##D 	finebalanceVars = c("ROLLOVER1.1", "FIRE_EXP1.1")
##D 	exactmatchon = "FR.pass"
##D 	
##D 	res = tripletmatching(distmat = distmat, grouplabel = c("NOSAB", "optSAB", "WITHSABS"), 
##D 	                design = c(3,3,1), indexgroup = indexgroup, .data = Dodgeram, 
##D 	                finebalanceVars = finebalanceVars, exactmatchon = exactmatchon)
##D 	
##D 	# covariance balance
##D 	vars = c("AGE", "SEX.2", "IMPACT3.3", "DR_DRINK")
##D 	details = c('std_diff', 'mean', 'function(x) diff(range(x))', 
##D 	                         'function(x) quantile(x, probs = .9)')
##D 	names(details) <- c('std_diff', 'mean', 'range', '90perc')
##D 	
##D 	covbalance(.data=Dodgeram, grouplabel=c("NOSAB", "optSAB", "WITHSABS"), 
##D 	                 matches = res, vars = vars, details)
##D 	
##D 	
## End(Not run)



