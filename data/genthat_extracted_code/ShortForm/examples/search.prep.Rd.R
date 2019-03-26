library(ShortForm)


### Name: search.prep
### Title: Given a fitted lavaan model (e.g., CFA), prepares a table that
###   contains parameters that can be fixed/freed as part of a model
###   specification search.
### Aliases: search.prep

### ** Examples

## Not run: 
##D # load simulation data and select columns used in this example
##D data(simulated_test_data) 
##D tabuData <- simulated_test_data[,c(1:10)]
##D 
##D # specify an improper model (improper because data is unidimensional)
##D tabuModel <- "
##D Ability =~ Item1 + Item2 + Item3 + Item4
##D FakeAbility =~ Item5 + Item6 + Item7 + Item8
##D Ability ~ Outcome
##D FakeAbility ~ 0*Outcome"
##D 
##D # run the initial misspecified model for Tabu
##D 
##D init.model <- lavaan::lavaan(model = tabuModel, data = tabuData, 
##D auto.var=TRUE, auto.fix.first=FALSE, std.lv=TRUE,auto.cov.lv.x=TRUE)
##D 
##D # Use search.prep to prepare for the Tabu search
##D ptab <- search.prep(fitted.model = init.model,loadings=TRUE,fcov=TRUE,errors=FALSE)
##D 
##D # add an additional (mispecified) parameter
##D additional.param <- 'Item1 ~~ 0.5*Item3'
##D ptab <- add.param(fitted.model = init.model, ptab = ptab, syntax = additional.param)
##D 
##D # Perform Tabu Search
##D trial <- tabu.sem(init.model = init.model, ptab = ptab, obj = AIC, niter = 2, tabu.size = 5)
## End(Not run)



