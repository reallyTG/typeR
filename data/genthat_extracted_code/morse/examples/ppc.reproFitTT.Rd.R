library(morse)


### Name: ppc.reproFitTT
### Title: Posterior predictive check plot for 'reproFitTT' objects
### Aliases: ppc.reproFitTT

### ** Examples


# (1) Load the data
data(cadmium1)

# (2) Create an object of class "reproData"
dataset <- reproData(cadmium1)

## Not run: 
##D # (3) Run the reproFitTT function with the log-logistic gamma-Poisson model
##D out <- reproFitTT(dataset, stoc.part = "gammapoisson",
##D ecx = c(5, 10, 15, 20, 30, 50, 80), quiet = TRUE)
##D 
##D # (4) Plot observed versus predicted values
##D ppc(out)
## End(Not run)




