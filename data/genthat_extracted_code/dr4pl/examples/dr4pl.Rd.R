library(dr4pl)


### Name: dr4pl
### Title: Fitting 4 Parameter Logistic (4PL) models to dose-response data.
### Aliases: dr4pl dr4pl-package dr4pl.formula dr4pl.data.frame
###   dr4pl.default

### ** Examples

  ##Assign method.init = "logistic" to use logistic method of estimation.
  ##default method
  a <- dr4pl(dose = sample_data_1$Dose,
             response = sample_data_1$Response,
             method.init = "logistic")
  plot(a)

  ##Use default or Assign method.init = "Mead" to use Mead's method of estimation.
  # Use method.robust to select desired loss function
  # formula method
  b <- dr4pl(formula = Response~Dose, 
             data = sample_data_4,
             method.init = "Mead", 
             method.robust = "Tukey" )
  plot(b)
  
  #data.frame method
  c <- dr4pl(data = sample_data_10,
             dose = Dose,
             response = Response)
  plot(c)

  ##compatable with ggplot
  library(ggplot2) #load ggplot2
  c <- dr4pl(Response~Dose, 
             data = drc_error_2, 
             method.optim = "CG", 
             trend = "decreasing" )
  d <- plot(c, x.breaks = c(.00135, .0135, .135, 1.35, 13.5))
  d + theme_grey()



