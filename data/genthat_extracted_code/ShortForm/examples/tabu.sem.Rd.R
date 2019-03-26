library(ShortForm)


### Name: tabu.sem
### Title: Given a fitted lavaan model, a search table, and an objective
###   criterion, performs a Tabu model specification search. Currently only
###   supports neighbors that are 1 move away from the current model.
### Aliases: tabu.sem

### ** Examples

# load simulation data and select columns used in this example
data(simulated_test_data) 
tabuData <- simulated_test_data[,c(1:10)]

# specify an improper model (improper because data is unidimensional)
tabuModel <- "
Ability =~ Item1 + Item2 + Item3 + Item4
FakeAbility =~ Item5 + Item6 + Item7 + Item8
Ability ~ Outcome
FakeAbility ~ 0*Outcome"

# run the initial misspecified model for Tabu

init.model <- lavaan::lavaan(model = tabuModel, data = tabuData, 
auto.var=TRUE, auto.fix.first=FALSE, std.lv=TRUE,auto.cov.lv.x=TRUE)

# Use search.prep to prepare for the Tabu search
ptab <- search.prep(fitted.model = init.model,loadings=TRUE,fcov=TRUE,errors=FALSE)

# Perform Tabu Search
trial <- tabu.sem(init.model = init.model, ptab = ptab, obj = AIC, niter = 2, tabu.size = 5)




