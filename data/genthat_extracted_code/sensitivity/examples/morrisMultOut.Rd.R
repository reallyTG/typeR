library(sensitivity)


### Name: morrisMultOut
### Title: Morris's Elementary Effects Screening Method for
###   Multidimensional Outputs
### Aliases: morrisMultOut tell.morrisMultOut

### ** Examples


  mdl <- function (X) t(atantemp.fun(X))

  x = morrisMultOut(model = mdl, factors = 4, r = 50, 
  design = list(type = "oat", levels = 5, grid.jump = 3), binf = -1, bsup = 5, scale = FALSE)
  print(x)
  plot(x)

  x = morrisMultOut(model = NULL, factors = 4, r = 50, 
  design = list(type = "oat", levels = 5, grid.jump = 3), binf = -1, bsup = 5, scale = FALSE)
  Y = mdl(x[['X']])
  tell(x, Y)	
  print(x)
  plot(x)	



