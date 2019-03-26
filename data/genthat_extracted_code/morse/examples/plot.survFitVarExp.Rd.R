library(morse)


### Name: plot.survFitVarExp
### Title: Plotting method for 'survFit' objects
### Aliases: plot.survFitVarExp
### Keywords: plot

### ** Examples


# (1) Load the survival data
data("propiconazole_pulse_exposure")

# (2) Create an object of class "survData"
dataset <- survData(propiconazole_pulse_exposure)

## Not run: 
##D # (3) Run the survFit function
##D out <- survFit(dataset , model_type = "SD")
##D 
##D # (4) Summary look the estimated values (parameters)
##D summary(out)
##D 
##D # (5) Plot the fitted curve
##D plot(out, adddata = FALSE)
##D 
##D # (6) Plot the fitted curve with ggplot style and CI as spaghetti
##D plot(out, spaghetti = TRUE)
## End(Not run)




