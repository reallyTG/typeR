library(morse)


### Name: plot.MFx
### Title: Plotting method for 'MFx' objects
### Aliases: plot.MFx
### Keywords: plot

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
##D # (5) estimate MF for 30% reduction of survival at time 4
##D MFx_SD_30.4 <- MFx(out_SD, data_predict = data_4prediction , X = 30, time_MFx = 4)
##D 
##D # (6) plot the object of class 'MFx'
##D plot(MFx_SD_30.4)
##D 
##D # (6bis) plot with log-scale of x-axis
##D plot(MFx_SD_30.4, log_scale = TRUE)
##D 
##D # (6ter) plot with "Time" as the x-axis
##D plot(MFx_SD_30.4, x_variable = "Time") 
##D 
##D # (7) plot when X = NULL and along a MFx_range from 5 to 10:
##D MFx_SD_range <- MFx(out_SD, data_predict = data_4prediction ,
##D                     X = NULL, time_MFx = 4, MFx_range = seq(5, 10, length.out = 50))
##D plot(MFx_SD_range)
##D plot(MFx_SD_range, x_variable = "Time", ncol = 10)
## End(Not run)




