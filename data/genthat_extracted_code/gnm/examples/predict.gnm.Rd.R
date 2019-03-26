library(gnm)


### Name: predict.gnm
### Title: Predict Method for Generalized Nonlinear Models
### Aliases: predict.gnm
### Keywords: models nonlinear

### ** Examples

set.seed(1)

##  Fit an association model with homogeneous row-column effects
RChomog <- gnm(Freq ~ origin + destination + Diag(origin, destination) +
               MultHomog(origin, destination), family = poisson,
               data = occupationalStatus)

## Fitted values (expected counts)
predict(RChomog, type = "response", se.fit = TRUE)

## Fitted values on log scale
predict(RChomog, type = "link", se.fit = TRUE)



