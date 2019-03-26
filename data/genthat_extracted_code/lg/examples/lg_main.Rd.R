library(lg)


### Name: lg_main
### Title: Create an 'lg' object
### Aliases: lg_main

### ** Examples

  x <- cbind(rnorm(100), rnorm(100), rnorm(100))

  # Quick example
  lg_object1 <- lg_main(x, bw_method = "plugin", est_method = "1par")

  # In the simulation experiments in Otneim & Tjøstheim (2017a),
  # the cross-validation bandwidth selection is used:
  ## Not run: 
##D   lg_object2 <- lg_main(x, bw_method = "cv", est_method = "1par")
##D   
## End(Not run)

  # If you do not wish to transform the data to standard normality,
  # use the five parameter fit:
  lg_object3 <- lg_main(x, est_method = "5par_marginals_fixed",
                  transform_to_marginal_normality = FALSE)

  # In the bivariate case, you can use the full nonparametric fit:
  x_biv <- cbind(rnorm(100), rnorm(100))
  lg_object4 <- lg_main(x_biv, est_method = "5par",
                  transform_to_marginal_normality = FALSE)

  # Whichever method you choose, the lg-object can now be passed on
  # to the dlg- or clg-functions for evaluation of the density or
  # conditional density estimate. Control the grid with the grid
  # argument.
  grid1 <- x[1:10,]
  dens_est <- dlg(lg_object1, grid = grid1)

  # The conditional density of X1 given X2 = 1 and X2 = 0:
  grid2 <- matrix(-3:3, ncol = 1)
  c_dens_est <- clg(lg_object1, grid = grid2, condition = c(1, 0))




