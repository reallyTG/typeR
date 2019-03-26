library(BayesMed)


### Name: Firefighters
### Title: Data from a study of health promotion of firefighters
### Aliases: Firefighters

### ** Examples

## Not run: 
##D data(Firefighters)
##D 
##D # mediation analysis
##D result <- jzs_med(Firefighters$x,Firefighters$y,Firefighters$m)
##D result
##D 
##D ### Note that the Bayes factor is 1.96, instead of 1.94 as reported 
##D ### in the paper (Nuijten et al., 2014). 
##D ### This is caused by rounding differences; the posterior probabilities are equal.
##D 
##D # underlying mediational model with path weights and posterior probabilities
##D plot(result$main_result)
##D 
##D # posterior distribution of indirect effect "ab" incl 95% credible interval
##D plot(result$ab_samples)
## End(Not run)



