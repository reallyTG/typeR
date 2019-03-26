library(morse)


### Name: plot.survFitTKTD
### Title: Plotting method for 'survFitTKTD' objects
### Aliases: plot.survFitTKTD
### Keywords: plot

### ** Examples


# (1) Load the survival data
data(propiconazole)

# (2) Create an object of class "survData"
dataset <- survData(propiconazole)

## Not run: 
##D # (3) Run the survFitTKTD function ('SD' model only)
##D out <- survFitTKTD(dataset)
##D 
##D # (4) Plot the fitted curves in one plot 
##D plot(out)
##D 
##D # (5) Plot one fitted curve per concentration with credible limits as
##D # spaghetti, data and confidence intervals
##D # and with a ggplot style
##D plot(out, spaghetti = TRUE , adddata = TRUE, one.plot = FALSE,
##D      style = "ggplot")
##D 
##D # (6) Plot fitted curve for one specific concentration
##D plot(out, concentration = 36, style = "ggplot")
## End(Not run)




