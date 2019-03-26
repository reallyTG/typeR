library(BayesTwin)


### Name: IRTtwin
### Title: Bayesian analysis of item-level twin data
### Aliases: IRTtwin
### Keywords: IRTtwin

### ** Examples

data(results)

#Summarize results
summary(results)

##Plot posterior distribution of var(A)
plotbayestwin(results$samples_var_a)

##Plot 95% credibility region of GxE interaction effect
geplot(results$var_a, results$samples_beta0, results$samples_beta1)

## Not run: 
##D ##Simulate data
##D data = simulate(irt_model = "1PL", var_a = 0.5, var_c = 0.3, ge_beta0 = log(0.2), 
##D                 ge = TRUE)
##D data_mz = data$y_mz
##D data_dz = data$y_dz
##D 
##D ##Run analysis
##D results = IRTtwin(data_mz, data_dz, 1:20, 21:40, ge = TRUE)
##D 
##D ##Summarize results: 
##D summary(results)
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



