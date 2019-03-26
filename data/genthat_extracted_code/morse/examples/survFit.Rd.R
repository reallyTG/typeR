library(morse)


### Name: survFit
### Title: Fits a TKTD model for survival analysis using Bayesian inference
### Aliases: survFit

### ** Examples


# (1) Load the survival data
data(propiconazole)

# (2) Create an object of class "survData"
dataset  <- survData(propiconazole)

## Not run: 
##D # (3) Run the survFit function with TKTD model 'SD' or 'IT' 
##D out <- survFit(dataset , model_type = "SD")
##D 
##D # (4) Summarize look the estimated parameters
##D summary(out)
##D 
##D # (5) Plot the fitted curve
##D plot(out, adddata = TRUE)
##D 
##D # (6) Plot the fitted curve with ggplot style and CI as spaghetti
##D plot(out, spaghetti = TRUE , adddata = TRUE)
## End(Not run)

# When the data set include variable exposure profile, time for inference is longer

# (1) Load the survival data with variable exposure profile
data("propiconazole_pulse_exposure")

# (2) Create an object of class "survData"
dataset <- survData(propiconazole_pulse_exposure)

## Not run: 
##D # (3) Run the survFit function with TKTD model 'SD' or 'IT' 
##D out <- survFit(dataset , model_type = "SD")
##D 
##D # (4) Summarize look the estimated parameters
##D summary(out)
##D 
##D # (5) Plot the fitted curve
##D plot(out, adddata = FALSE)
##D 
##D # (6) Plot the fitted curve with ggplot style and CI as spaghetti
##D plot(out, spaghetti = TRUE)
## End(Not run)





