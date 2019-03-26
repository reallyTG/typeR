library(dr4pl)


### Name: vcov.dr4pl
### Title: Obtain the variance-covariance matrix of the parameter
###   estimators of a 4PL model.
### Aliases: vcov.dr4pl

### ** Examples

obj.dr4pl <- dr4pl(Response ~ Dose, data = sample_data_1)  # Fit a 4PL model to data
vcov(obj.dr4pl)  # Variance-covariance matrix of the parameters

obj.dr4pl <- dr4pl(Response ~ Dose, data = sample_data_2)  # Fit a 4PL model to data
vcov(obj.dr4pl)  # Variance-covariance matrix of the parameters




