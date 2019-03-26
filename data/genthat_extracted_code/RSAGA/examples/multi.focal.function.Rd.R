library(RSAGA)


### Name: multi.focal.function
### Title: Local and Focal Grid Function with Multiple Grids as Inputs
### Aliases: multi.focal.function multi.local.function
### Keywords: spatial

### ** Examples

## Not run: 
##D # Assume that d is a data.frame with point observations
##D # of a numerical response variable y and predictor variables
##D # a, b, and c.
##D # Fit a generalized additive model to y,a,b,c.
##D # We want to model b and c as nonlinear terms:
##D require(gam)
##D fit <- gam(y ~ a + s(b) + s(c), data = d)
##D multi.local.function(in.grids = c("a", "b", "c"),
##D     out.varnames = "pred",
##D     fun = grid.predict, fit = fit )
##D     # Note that the 'grid.predict' uses by default the
##D     # predict method of 'fit'.
##D # Model predictions are written to a file named pred.asc
## End(Not run)

## Not run: 
##D # A fake example of a logistic additive model:
##D require(gam)
##D fit <- gam(cl ~ a + s(b) + s(c), data = d, family = binomial)
##D multi.local.function(in.grids = c("a", "b", "c"),
##D     out.varnames = "pred",
##D     fun = grid.predict, fit = fit,
##D     control.predict = list(type = "response") )
##D     # 'control.predict' is passed on to 'grid.predict', which
##D     # dumps its contents into the arguments for 'fit''s
##D     # 'predict' method.
##D # Model predictions are written to a file named pred.asc
## End(Not run)



