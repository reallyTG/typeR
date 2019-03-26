library(variables)


### Name: numeric_var
### Title: Numeric Variable
### Aliases: numeric_var

### ** Examples


  numeric_var("age", "age of patient", "years", support = 25:75)

  numeric_var("time", "survival time", "days", support = 0:365)

  numeric_var("time", "survival time", "days", support = c(0.0, 365), 
              bounds = c(0, Inf))




