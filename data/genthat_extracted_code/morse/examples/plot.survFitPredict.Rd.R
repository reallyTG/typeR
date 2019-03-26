library(morse)


### Name: plot.survFitPredict
### Title: Plotting method for 'survFitPredict' objects
### Aliases: plot.survFitPredict
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
##D # (4) Create a new data table for prediction
##D data_4prediction <- data.frame(time = 1:10, conc = c(0,5,5,5,0,0,5,5,5,5),
##D  replicate= rep("predict", 10))
##D 
##D # (5) Predict on a new dataset
##D predict_out <- predict(out, data_predict = data_4prediction, spaghetti = TRUE)
##D 
##D # (6) Plot the predicted curve
##D plot(predict_out)
##D plot(predict_out, spaghetti = TRUE)
## End(Not run)




