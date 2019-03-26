library(dr4pl)


### Name: drc_error_3
### Title: Support Problem and Outliers at a Single Dose Level
### Aliases: drc_error_3
### Keywords: sample_data

### ** Examples

  a <- dr4pl(Response~Dose, data = drc_error_3, method.init = "Mead", method.robust = "Huber")
  plot(a)



