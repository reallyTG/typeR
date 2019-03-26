library(morse)


### Name: ppc.survFitVarExp
### Title: Posterior predictive check plot for 'survFitVarExp' objects
### Aliases: ppc.survFitVarExp

### ** Examples


# (1) Load the data
data(propiconazole_pulse_exposure)

# (2) Create an object of class "survData"
dat <- survData(propiconazole_pulse_exposure)

## Not run: 
##D # (3) Run the survFitTKTD function with the TKTD model ('SD' or 'IT')
##D out <- survFit(dat, model_type = "SD")
##D 
##D # (4) Plot observed versus predicted values
##D ppc(out)
## End(Not run)




