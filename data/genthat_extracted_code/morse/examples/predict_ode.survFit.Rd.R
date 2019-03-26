library(morse)


### Name: predict_ode.survFit
### Title: Predict method for 'survFit' objects
### Aliases: predict_ode.survFit

### ** Examples


# (1) Load the survival data
data("propiconazole_pulse_exposure")

# (2) Create an object of class "survData"
dataset <- survData(propiconazole_pulse_exposure)

## Not run: 
##D # (3) Run the survFit function
##D out <- survFit(dataset , model_type = "SD")
##D 
##D # (4) Create a new data table for prediction
##D data_4prediction <- data.frame(time = 1:10,
##D                                conc = c(0,5,30,30,0,0,5,30,15,0),
##D                                replicate= rep("predict", 10))
##D 
##D # (5) Predict on a new data set
##D predict_out <- predict_ode(object = out, data_predict = data_4prediction,
##D                            mcmc_size = 1000, spaghetti = TRUE)
##D 
## End(Not run)




