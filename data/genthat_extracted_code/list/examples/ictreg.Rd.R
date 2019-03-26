library(list)


### Name: ictreg
### Title: Item Count Technique
### Aliases: ictreg ict list
### Keywords: models regression

### ** Examples



data(race)

set.seed(1)

# Calculate list experiment difference in means

diff.in.means.results <- ictreg(y ~ 1, data = race, 
	       	      treat = "treat", J=3, method = "lm")

summary(diff.in.means.results)

# Fit linear regression
# Replicates Table 1 Columns 1-2 Imai (2011); note that age is divided by 10

lm.results <- ictreg(y ~ south + age + male + college, data = race, 
	       	      treat = "treat", J=3, method = "lm")

summary(lm.results)

# Fit two-step non-linear least squares regression
# Replicates Table 1 Columns 3-4 Imai (2011); note that age is divided by 10

nls.results <- ictreg(y ~ south + age + male + college, data = race, 
	       	      treat = "treat", J=3, method = "nls")

summary(nls.results)

## Not run: 
##D 
##D # Fit EM algorithm ML model with constraint
##D # Replicates Table 1 Columns 5-6, Imai (2011); note that age is divided by 10
##D 
##D ml.constrained.results <- ictreg(y ~ south + age + male + college, data = race, 
##D 		       	  	 treat = "treat", J=3, method = "ml", 
##D 				 overdispersed = FALSE, constrained = TRUE)
##D 
##D summary(ml.constrained.results)
##D 
##D # Fit EM algorithm ML model with no constraint
##D # Replicates Table 1 Columns 7-10, Imai (2011); note that age is divided by 10
##D 
##D ml.unconstrained.results <- ictreg(y ~ south + age + male + college, data = race, 
##D 			    	   treat = "treat", J=3, method = "ml", 
##D 				   overdispersed = FALSE, constrained = FALSE)
##D 
##D summary(ml.unconstrained.results)
##D 
##D # Fit EM algorithm ML model for multiple sensitive items
##D # Replicates Table 3 in Blair and Imai (2010)
##D 
##D multi.results <- ictreg(y ~ male + college + age + south + south:age, treat = "treat", 
##D 	      	 	J = 3, data = multi, method = "ml", 
##D 			multi.condition = "level")
##D 
##D summary(multi.results)
##D 
##D # Fit standard design ML model
##D # Replicates Table 7 Columns 1-2 in Blair and Imai (2010)
##D 
##D noboundary.results <- ictreg(y ~ age + college + male + south, treat = "treat",
##D 		      	     J = 3, data = affirm, method = "ml", 
##D 			     overdispersed = FALSE)
##D 
##D summary(noboundary.results)
##D 
##D # Fit standard design ML model with ceiling effects alone
##D # Replicates Table 7 Columns 3-4 in Blair and Imai (2010)
##D 
##D ceiling.results <- ictreg(y ~ age + college + male + south, treat = "treat", 
##D 		   	  J = 3, data = affirm, method = "ml", fit.start = "nls",
##D 			  ceiling = TRUE, ceiling.fit = "bayesglm",
##D 			  ceiling.formula = ~ age + college + male + south)
##D 
##D summary(ceiling.results)
##D 
##D # Fit standard design ML model with floor effects alone
##D # Replicates Table 7 Columns 5-6 in Blair and Imai (2010)
##D 
##D floor.results <- ictreg(y ~ age + college + male + south, treat = "treat", 
##D 	      	 	J = 3, data = affirm, method = "ml", fit.start = "glm", 
##D 			floor = TRUE, floor.fit = "bayesglm",
##D 			floor.formula = ~ age + college + male + south)
##D 
##D summary(floor.results)
##D 
##D # Fit standard design ML model with floor and ceiling effects
##D # Replicates Table 7 Columns 7-8 in Blair and Imai (2010)
##D 
##D both.results <- ictreg(y ~ age + college + male + south, treat = "treat", 
##D 	     	       J = 3, data = affirm, method = "ml", 
##D 		       floor = TRUE, ceiling = TRUE, 
##D 		       floor.fit = "bayesglm", ceiling.fit = "bayesglm",
##D 		       floor.formula = ~ age + college + male + south,
##D 		       ceiling.formula = ~ age + college + male + south)
##D 
##D summary(both.results)
##D 
##D # Response error models (Blair, Imai, and Chou 2018)
##D 
##D top.coded.error <- ictreg(
##D    y ~ age + college + male + south, treat = "treat",
##D    J = 3, data = race, method = "ml", error = "topcoded")
##D    
##D uniform.error <- ictreg(
##D    y ~ age + college + male + south, treat = "treat",
##D    J = 3, data = race, method = "ml", error = "topcoded")
##D    
##D # Robust models, which constrain sensitive item proportion
##D #   to difference-in-means estimate
##D 
##D robust.ml <- ictreg(
##D    y ~ age + college + male + south, treat = "treat",
##D    J = 3, data = affirm, method = "ml", robust = TRUE)
##D 
##D robust.nls <- ictreg(
##D    y ~ age + college + male + south, treat = "treat",
##D    J = 3, data = affirm, method = "nls", robust = TRUE)
##D    
## End(Not run)




