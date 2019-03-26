library(mediation)


### Name: mediations
### Title: Causal Mediation Analysis for Multiple
###   Outcome/Treatment/Mediator Combinations
### Aliases: mediations

### ** Examples
 
## Not run: 
##D # Hypothetical example
##D 
##D datasets <- list(T1 = T1, T2 = T2)
##D     # List of data frames corresponding to the two different treatment variables 
##D     #"T1vsCont" and "T2vsCont". 
##D     # Each data set has its respective treatment variable.
##D     
##D mediators <- c("M1", "M2") 
##D     # Vector of mediator names, all included in each data frame.
##D 
##D outcome <- c("Ycont1","Ycont2")
##D     # Vector of outcome variable names, again all included in each data frame.
##D     
##D treatment <- c("T1vsCont", "T2vsCont")
##D     # Vector of treatment variables names; must begin with identical strings with dataset 
##D     # names in 'datasets'.
##D     
##D covariates <- c("X1 + X2")
##D     # Set of covariates (in each data set), entered using the standard model formula format.
##D 
##D x <- mediations(datasets, treatment, mediators, outcome, covariates,
##D     families=c("gaussian","gaussian"), interaction=FALSE, 
##D     conf.level=.90, sims=50) 
##D     # Runs 'mediate' iteratively for each variable combinations, with 'lm' on both mediator 
##D     # and outcome model.
##D 
##D summary(x)  # tabular summary of results for all model combinations
##D plot(x)  # graphical summary of results for all model combinations at once
##D 
##D plot(x$Ycont1.T1vsCont.M1) 
##D     # Individual 'mediate' outputs are stored as list elements and can be 
##D     # accessed using the usual "$" operator.
## End(Not run)



