library(PKNCA)


### Name: PKNCA
### Title: Compute noncompartmental pharmacokinetics
### Aliases: PKNCA PKNCA-package

### ** Examples

## Not run: 
##D # Load concentration-time data into a data.frame called d.conc
##D # with columns named "conc", "time", and "subject".
##D my.conc <- PKNCAconc(d.conc, conc~time|subject)
##D # Load dose-time data into a data.frame called d.dose
##D # with columns named "dose", "time", and "subject".
##D my.dose <- PKNCAdose(d.dose, dose~time|subject)
##D # Combine the concentration-time and dose-time data into an object
##D # ready for calculations.
##D my.data <- PKNCAdata(my.conc, my.dose)
##D # Perform the calculations
##D my.results <- pk.nca(my.data)
##D # Look at summary results
##D summary(my.results)
##D # Look at a listing of results
##D as.data.frame(my.results)
## End(Not run)



