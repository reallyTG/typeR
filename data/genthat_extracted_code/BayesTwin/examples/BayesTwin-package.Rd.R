library(BayesTwin)


### Name: BayesTwin
### Title: Bayesian analysis of item-level twin data
### Aliases: BayesTwin

### ** Examples

data(results)
summary(results)

#Using the output to obtain the 95% HPD for additive genetic variance 
HPD(results$samples_var_a)

#Using the output to obtain the 90% HPD for all item difficulty parameters
apply(results$samples_item_b, 1, function (x) HPD(x, 0.90))

## Not run: 
##D ##Simulate Item-level twin data under the 1PL Rasch model 
##D data = simulatetwin(irt_model = "1PL", var_a = 0.5, var_c = 0.3, ge_beta0 = log(0.2), 
##D                     ge = TRUE)
##D                 
##D data_mz = data$y_mz
##D data_dz = data$y_dz
##D 
##D ##Analyse the simulated data under an 1PL model with GxE
##D results = IRTtwin(data_mz, data_dz, 1:20, 21:40, ge = TRUE)
##D 
##D ##Summarize results: 
##D summary(results)
##D 
##D #Using the output to obtain the 95% HPD for additive genetic variance 
##D HPD(results$samples_var_a)
##D 
##D #Using the output to obtain the 90% HPD for all item difficulty parameters
##D apply(results$samples_item_b, 1, function (x) HPD(x, 0.90))
##D 
##D ##Plot trace lines for var(A)
##D plotbayestwin(results$samples_var_a, type = "trace")
##D 
##D ##Plot posterior distribution of var(A)
##D plotbayestwin(results$samples_var_a)
##D 
##D ##Plot 95% credibility region of GxE interaction effect
##D geplot(results$var_a, results$samples_beta0, results$samples_beta1)
## End(Not run)



