library(stpm)


### Name: stpm
### Title: Stochastic Process Model for Analysis of Longitudinal and
###   Time-to-Event Outcomes
### Aliases: stpm stpm-package stpm-package
### Keywords: Stochastic allostatic hazard load, longitudinal model,
###   process quadratic studies, time-to-event

### ** Examples

## Not run: 
##D  
##D library(stpm)
##D #Prepare data for optimization
##D data <- prepare_data(x=system.file("extdata","longdat.csv",package="stpm"), covariates="BMI")
##D #Parameters estimation (default model: discrete-time):
##D p.discr.model <- spm(data)
##D p.discr.model
##D # Continuous-time model:
##D p.cont.model <- spm(data, model="continuous")
##D p.cont.model
##D #Model with time-dependent coefficients:
##D data <- prepare_data(x=system.file("extdata","longdat.csv",package="stpm"), covariates="BMI")
##D p.td.model <- spm(data, model="time-dependent")
##D p.td.model
## End(Not run)



