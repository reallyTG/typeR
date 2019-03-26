library(list)


### Name: summary.ictreg
### Title: Summary Method for the Item Count Technique
### Aliases: summary.ictreg
### Keywords: models regression

### ** Examples


data(race)
## Not run: 
##D # Fit standard design ML model with ceiling effects
##D # Replicates Table 7 Columns 3-4 in Blair and Imai (2012)
##D 
##D ceiling.results <- ictreg(y ~ age + college + male + south, treat = "treat", 
##D 		   	  J = 3, data = affirm, method = "ml", fit.start = "nls",
##D 			  ceiling = TRUE, ceiling.fit = "bayesglm",
##D 			  ceiling.formula = ~ age + college + male + south)
##D 
##D # Summarize fit object and generate conditional probability 
##D # of ceiling liars the population proportion of ceiling liars,
##D # both with standard errors.
##D # Replicates Table 7 Columns 3-4 last row in Blair and Imai (2012)
##D 
##D summary(ceiling.results, boundary.proportions = TRUE)
## End(Not run)





