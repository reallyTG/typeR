library(stilt)


### Name: emulator
### Title: Function to fit an emulator to ensemble model output
### Aliases: emulator

### ** Examples

# Fit an emulator to the example 1D parameter ensemble data
# Do not use any covariates, use standard settings
data(Data.1D.model)
data(Data.1D.par)
emul.1D <- emulator(Data.1D.par, Data.1D.model, FALSE, FALSE, 1, 1)

# Take a look at the range and regression parameters
cat("Range parameters are:", emul.1D$phi.vec, "\n")
cat("Regression parameters are:", emul.1D$beta.vec, "\n")

# Predict using the emulator at Theta*=3
pred.1D <- predict(emul.1D, 3)

# Plot the prediction
plot(emul.1D$t.vec, pred.1D$mean, xlab="Year", ylab="Sample Output")


## Not run: 
##D     # Fit an emulator to the UVic ESCM 3-parameter ensemble temperature
##D     # output Use time and aerosol scaling covariates (parameter 3), run
##D     # the optimization twice with relative tolerance of 0.1, keep
##D     # regression parameters at their multiple linear regression
##D     # estimates data(Data.UVic.model) data(Data.UVic.par) UVic.emul <-
##D     # emulator(mpars=Data.UVic.par, moutput=Data.UVic.model,
##D     # par.reg=c(FALSE, FALSE, TRUE), time.reg=TRUE, kappa0=1, zeta0=1,
##D     # myrel.tol=0.1, twice=TRUE, fix.betas=TRUE)
##D    
## End(Not run)



