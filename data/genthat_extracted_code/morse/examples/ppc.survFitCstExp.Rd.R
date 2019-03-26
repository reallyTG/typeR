library(morse)


### Name: ppc.survFitCstExp
### Title: Posterior predictive check plot for 'survFitCstExp' objects
### Aliases: ppc.survFitCstExp

### ** Examples


# (1) Load the data
data(propiconazole)

# (2) Create an object of class "survData"
dataset <- survData(propiconazole)

## Not run: 
##D # (3) Run the survFitTKTD function with the TKTD model ('SD' or 'IT')
##D out <- survFit(dataset, model_type = "SD")
##D 
##D # (4) Plot observed versus predicted values
##D ppc(out)
## End(Not run)




