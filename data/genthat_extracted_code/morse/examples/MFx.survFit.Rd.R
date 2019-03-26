library(morse)


### Name: MFx.survFit
### Title: Predict x% Multiplication Factor at any specified time point for
###   a 'survFit' object.
### Aliases: MFx.survFit

### ** Examples


# (1) Load the data
data("propiconazole")

# (2) Create an object of class 'survData'
dataset <- survData(propiconazole)

## Not run: 
##D # (3) Run the survFit function with model_type SD (or IT)
##D out_SD <- survFit(dataset, model_type = "SD")
##D 
##D # (4) data to predict
##D data_4prediction <- data.frame(time = 1:10, conc = c(0,0.5,3,3,0,0,0.5,3,1.5,0))
##D 
##D # (5) estimate MF(x=30, t=4), that is for 30% reduction of survival at time 4
##D MFx_SD_30.4 <- MFx(out_SD, data_predict = data_4prediction , X = 30, time_MFx = 4)
##D 
##D # (5bis) estimate MF(x,t) along the MF_range from 5 to 10 (50) (X = NULL)
##D MFx_SD_range <- MFx(out_SD, data_predict = data_4prediction ,
##D                     X = NULL, time_MFx = 4, MFx_range = seq(5, 10, length.out = 50))
## End(Not run)





