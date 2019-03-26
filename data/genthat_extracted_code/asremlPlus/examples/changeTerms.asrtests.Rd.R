library(asremlPlus)


### Name: changeTerms.asrtests
### Title: Adds and drops the specified sets of terms from one or both of
###   the fixed or random model and/or replaces the residual (rcov) model
###   with a new model.
### Aliases: changeTerms.asrtests changeTerms
### Keywords: asreml

### ** Examples
## Not run: 
##D terms <- "(Date/(Sources * (Type + Species)))"
##D current.asrt <- changeTerms(current.asrt, addFixed = terms)
##D 
##D current.asrt <- changeTerms(current.asrt, dropFixed = "A + B", denDF = "algebraic")
##D 
##D data(Wheat.dat)
##D current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                       random = ~ Row + Column + units,
##D                       residual = ~ ar1(Row):ar1(Column), 
##D                       data=Wheat.dat)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D current.asrt <- rmboundary(current.asrt)
##D # Add and drop both fixed and random terms
##D current.asrt <- changeTerms(current.asrt, 
##D                             addFixed = "vRow", dropFixed = "WithinColPairs", 
##D                             addRandom = "spl(vRow)", dropRandom = "units", 
##D                             checkboundaryonly = TRUE)
##D # Replace residual with model without Row autocorrelation
##D current.asrt <- changeTerms(current.asrt, 
##D                             newResidual = "Row:ar1(Column)", 
##D                             label="Row autocorrelation")
##D 
## End(Not run)


