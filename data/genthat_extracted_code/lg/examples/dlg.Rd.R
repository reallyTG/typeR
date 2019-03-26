library(lg)


### Name: dlg
### Title: The locally Gaussian density estimator (LGDE)
### Aliases: dlg

### ** Examples

   x <- cbind(rnorm(100), rnorm(100), rnorm(100))
   lg_object <- lg_main(x)  # Put all the running parameters in here.
   grid <- cbind(seq(-4, 4, 1), seq(-4, 4, 1), seq(-4, 4, 1))
   density_estimate <- dlg(lg_object, grid = grid)




