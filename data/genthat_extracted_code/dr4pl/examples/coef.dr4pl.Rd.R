library(dr4pl)


### Name: coef.dr4pl
### Title: Obtain coefficients of a 4PL model
### Aliases: coef.dr4pl

### ** Examples

obj.dr4pl <- dr4pl(Response ~ Dose, data = sample_data_2)  # Fit a 4PL model to data
coef(obj.dr4pl)  # Print parameter estimates

obj.dr4pl <- dr4pl(Response ~ Dose, data = sample_data_3)  # Fit a 4PL model to data
coef(obj.dr4pl)  # Print parameter estimates




