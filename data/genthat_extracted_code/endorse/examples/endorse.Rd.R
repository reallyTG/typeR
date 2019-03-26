library(endorse)


### Name: endorse
### Title: Fitting the Measurement Model of Political Support via Markov
###   Chain Monte Carlo
### Aliases: endorse

### ** Examples

## Not run: 
##D data(pakistan)
##D 
##D Y <- list(Q1 = c("Polio.a", "Polio.b", "Polio.c", "Polio.d", "Polio.e"),
##D           Q2 = c("FCR.a", "FCR.b", "FCR.c", "FCR.d", "FCR.e"),
##D           Q3 = c("Durand.a", "Durand.b", "Durand.c", "Durand.d",
##D                  "Durand.e"),
##D           Q4 = c("Curriculum.a", "Curriculum.b", "Curriculum.c",
##D                  "Curriculum.d", "Curriculum.e"))
##D 
##D 
##D 
##D ## Varying-lambda non-hierarchical model without covariates
##D endorse.out <- endorse(Y = Y, data = pakistan, identical.lambda = FALSE,
##D                        covariates = FALSE, hierarchical = FALSE)
##D 
##D ## Varying-lambda non-hierarchical model with covariates
##D indiv.covariates <- formula( ~ female + rural)
##D endorse.out <- endorse(Y = Y, data = pakistan, identical.lambda = FALSE,
##D                        covariates = TRUE,
##D                        formula.indiv = indiv.covariates,
##D                        hierarchical = FALSE)
##D 
##D ## Common-lambda non-hierarchical model with covariates
##D indiv.covariates <- formula( ~ female + rural)
##D endorse.out <- endorse(Y = Y, data = pakistan, identical.lambda = TRUE,
##D                        covariates = TRUE,
##D                        formula.indiv = indiv.covariates,
##D                        hierarchical = FALSE)
##D 
##D ## Varying-lambda hierarchical model without covariates
##D div.data <- data.frame(division = sort(unique(pakistan$division)))
##D div.formula <- formula(~ 1)
##D endorse.out <- endorse(Y = Y, data = pakistan, data.village = div.data,
##D                        village = "division", identical.lambda = FALSE,
##D                        covariates = FALSE, hierarchical = TRUE,
##D                        formula.village = div.formula)
##D 
##D ## Varying-lambda hierarchical model with covariates
##D endorse.out <- endorse(Y = Y, data = pakistan, data.village = div.data,
##D                        village = "division", identical.lambda = FALSE,
##D                        covariates = TRUE,
##D                        formula.indiv = indiv.covariates,
##D                        hierarchical = TRUE,
##D                        formula.village = div.formula)
##D 
##D ## Common-lambda hierarchical model without covariates
##D endorse.out <- endorse(Y = Y, data = pakistan, data.village = div.data,
##D                        village = "division", identical.lambda = TRUE,
##D                        covariates = FALSE, hierarchical = TRUE,
##D                        formula.village = div.formula)
##D 
##D ## Common-lambda hierarchical model with covariates
##D endorse.out <- endorse(Y = Y, data = pakistan, data.village = div.data,
##D                        village = "division", identical.lambda = TRUE,
##D                        covariates = TRUE,
##D                        formula.indiv = indiv.covariates,
##D                        hierarchical = TRUE,
##D                        formula.village = div.formula)
## End(Not run)



