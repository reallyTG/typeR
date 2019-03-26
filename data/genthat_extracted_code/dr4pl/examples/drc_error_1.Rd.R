library(dr4pl)


### Name: drc_error_1
### Title: Single High Outlier
### Aliases: drc_error_1
### Keywords: sample_data

### ** Examples

  a <- dr4pl(Response~Dose, data = drc_error_1, method.init = "logistic", method.robust = "Tukey")
  plot(a)



