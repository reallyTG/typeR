library(Luminescence)


### Name: fit_CWCurve
### Title: Nonlinear Least Squares Fit for CW-OSL curves '[beta version]'
### Aliases: fit_CWCurve
### Keywords: dplot models

### ** Examples


##load data
data(ExampleData.CW_OSL_Curve, envir = environment())

##fit data
fit <- fit_CWCurve(values = ExampleData.CW_OSL_Curve,
                   main = "CW Curve Fit",
                   n.components.max = 4,
                   log = "x")
                   



