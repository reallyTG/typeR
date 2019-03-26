library(PTE)


### Name: PTE_bootstrap_inference
### Title: Bootstrap inference for a prespecified personalization /
###   recommendation model
### Aliases: PTE_bootstrap_inference

### ** Examples

## Not run: 
##D 	library(PTE)
##D 	B = 1000 #lower this for quicker demos
##D 
##D 	##response: continuous
##D 	data(continuous_example)
##D 	X = continuous_example$X
##D  y = continuous_example$y
##D 	pte_results = PTE_bootstrap_inference(X, y, regression_type = "continuous", B = B)
##D 	pte_results
##D 
##D 	##response: incidence
##D 	data(continuous_example)
##D 	X = continuous_example$X
##D  y = continuous_example$y
##D 	y = ifelse(y > quantile(y, 0.75), 1, 0) #force incidence and pretend y came to you this way
##D #there are three ways to assess incidence effects below: 
##D 	#	odds ratio, risk ratio and probability difference 
##D 	pte_results = PTE_bootstrap_inference(X, y, regression_type = "incidence", B = B)
##D 	pte_results
##D 	pte_results = PTE_bootstrap_inference(X, y, regression_type = "incidence", B = B, 
##D                                       incidence_metric = "risk_ratio")
##D 	pte_results
##D 	pte_results = PTE_bootstrap_inference(X, y, regression_type = "incidence", B = B, 
##D 	                                      incidence_metric = "probability_difference")
##D 	pte_results
##D 
##D 	##response: survival
##D 	data(survival_example)
##D 	X = survival_example$X
##D 	y = survival_example$y
##D  censored = survival_example$censored
##D 	pte_results = PTE_bootstrap_inference(X, y, censored = censored, 
##D     	regression_type = "survival", 
##D         B = 1000)
##D 	pte_results
## End(Not run)



