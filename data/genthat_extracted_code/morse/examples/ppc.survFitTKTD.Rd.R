library(morse)


### Name: ppc.survFitTKTD
### Title: Posterior predictive check plot for 'survFitTKTD' objects
### Aliases: ppc.survFitTKTD

### ** Examples


# (1) Load the data
data(propiconazole)

# (2) Create an object of class "survData"
dat <- survData(propiconazole)

## Not run: 
##D # (3) Run the survFitTKTD function with the TKTD model ('SD' only)
##D out <- survFitTKTD(dat)
##D 
##D # (4) Plot observed versus predicted values
##D ppc(out)
## End(Not run)




