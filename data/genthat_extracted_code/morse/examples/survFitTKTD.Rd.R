library(morse)


### Name: survFitTKTD
### Title: Fits a TKTD for survival analysis using Bayesian inference for
###   'survDataTKTD' object
### Aliases: survFitTKTD
### Keywords: estimation

### ** Examples


# (1) Load the survival data
data(propiconazole)

# (2) Create an object of class "survData"
dataset <- survData(propiconazole)

## Not run: 
##D # (3) Run the survFitTKTD function
##D out <- survFitTKTD(dataset)
##D 
##D # (4) Summarize look the estimated parameters
##D summary(out)
##D 
##D # (5) Plot the fitted curve
##D plot(out, adddata = TRUE)
##D 
##D # (6) Plot the fitted curve with ggplot style and CI as spaghetti
##D plot(out, spaghetti = TRUE , adddata = TRUE,
##D      style = "ggplot")
## End(Not run)




