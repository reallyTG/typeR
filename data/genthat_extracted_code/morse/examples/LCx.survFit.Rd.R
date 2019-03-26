library(morse)


### Name: LCx.survFit
### Title: Predict x% Lethal Concentration at any specified time point for
###   a 'survFit' object.
### Aliases: LCx.survFit

### ** Examples


# (1) Load the data
data("propiconazole")

# (2) Create an object of class 'survData'
dataset <- survData(propiconazole)

## Not run: 
##D # (3) Run the survFit function with model_type SD (or IT)
##D out_SD <- survFit(dataset, model_type = "SD")
##D 
##D # (4) estimate LC50 at time 4
##D LCx(out_SD, X = 50, time_LCx = 4)
## End(Not run)




