library(morse)


### Name: plot.LCx
### Title: Plotting method for 'LCx' objects
### Aliases: plot.LCx
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
##D # (4) estimate LC50 at time 4
##D LCx_SD <- LCx(out_SD, X = 50, time_LCx = 4)
##D 
##D # (5) plot the object of class 'LCx'
##D plot(LCx_SD)
## End(Not run)




