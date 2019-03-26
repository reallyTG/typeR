library(Evapotranspiration)


### Name: ReadInputs
### Title: ReadInputs raw date and climate data
### Aliases: ReadInputs
### Keywords: ReadInputs evapotranspiration data pre-processing

### ** Examples

# ReadInputs climate data
data("climatedata")
data("constants")
data <- ReadInputs(varnames = c("Temp","Tdew","n","RH","uz"),
                   climatedata, 
                   constants, 
                   stopmissing=c(10,10,3),
                   timestep = "subdaily",
                   interp_missing_days = FALSE, 
                   interp_missing_entries = FALSE, 
                   interp_abnormal = FALSE, 
                   missing_method = NULL, 
                   abnormal_method = NULL)



