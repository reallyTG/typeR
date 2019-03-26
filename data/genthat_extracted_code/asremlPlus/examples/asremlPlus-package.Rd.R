library(asremlPlus)


### Name: asremlPlus-package
### Title: Augments 'ASReml-R' in Fitting Mixed Models and Packages
###   Generally in Exploring Prediction Differences
### Aliases: asremlPlus-package asremlPlus
### Keywords: package

### ** Examples
## Not run: 
##D ## Analyse wheat dat using asreml and asremlPlus
##D ## Set up for analysis
##D library(dae)
##D library(asreml)
##D library(asremlPlus)
##D ## use ?Wheat.dat for data set details
##D data(Wheat.dat)
##D 
##D # Fit initial model
##D current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                       random = ~ Row + Column + units,
##D                       residual = ~ ar1(Row):ar1(Column), 
##D                       data=Wheat.dat)
##D summary(current.asr)
##D 
##D # Load current fit into an asrtests object
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D 
##D # Check for and remove any boundary terms
##D current.asrt <- rmboundary(current.asrt)
##D 
##D # Check term for within Column pairs
##D current.asrt <- testranfix(current.asrt, "WithinColPairs", drop.fix.ns=TRUE)
##D   
##D # Test nugget term
##D current.asrt <- testranfix(current.asrt, "units", positive=TRUE)
##D   
##D # Test Row autocorrelation
##D current.asrt <- testresidual(current.asrt, "~ Row:ar1(Column)", 
##D                              label="Row autocorrelation", simpler=TRUE)
##D   
##D # Test Col autocorrelation (depends on whether Row autocorrelation retained)
##D k <- match("Row autocorrelation", current.asrt$test.summary$terms)
##D p <- current.asrt$test.summary$p
##D { if (p[k] <= 0.05)
##D     current.asrt <- testresidual(current.asrt, "~ ar1(Row):Column", 
##D                                  label="Col autocorrelation", simpler=TRUE,
##D                                  update=FALSE)
##D     else
##D       current.asrt <- testresidual(current.asrt, "~ Row:Column", 
##D                                    label="Col autocorrelation", simpler=TRUE,
##D                                    update=FALSE)
##D }
##D print(current.asrt)
##D info <- infoCriteria(current.asrt$asreml.obj)
##D 
##D # Get current fitted asreml object
##D current.asr <- current.asrt$asreml.obj
##D current.asr <- update(current.asr, aom=TRUE)
##D   
##D   
##D # Do residuals-versus-fitted values plot
##D plot(fitted(current.asr),residuals(current.asr))
##D   
##D #Produce variogram and variogram faces plot (Stefanaova et al, 2009)
##D plot.varioGram(varioGram(current.asr))
##D faces <- variofaces(current.asr, V=V, maxiter=50, units="addtores")
##D 
##D #Get Variety predictions, sorted in increasing order for the predicted values, 
##D #and all pairwise prediction differences and p-values. Plot the latter.
##D Var.diffs <- predictPlus(classify = "Variety", 
##D                          asreml.obj=current.asr, 
##D                          error.intervals="halfLeast",
##D                          wald.tab=current.asrt$wald.tab,
##D                          tables = "predictions", 
##D                          sortFactor = "Variety")
##D print(Var.diffs, which = c("differences", "p.differences"))
##D plotPvalues(Var.diffs)
## End(Not run)


