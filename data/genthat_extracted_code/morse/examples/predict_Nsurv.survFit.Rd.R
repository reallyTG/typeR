library(morse)


### Name: predict_Nsurv.survFit
### Title: 'Predict_Nsurv' method for 'survFit' objects
### Aliases: predict_Nsurv.survFit

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
##D                                replicate= rep("predict", 10),
##D                                Nsurv = c(20,20,17,16,15,15,15,14,13,12))
##D 
##D # (5) Predict Nsurv on a new data set
##D predict_out <- predict_Nsurv(object = out, data_predict = data_4prediction, spaghetti = TRUE)
##D 
## End(Not run)





