library(bnclassify)


### Name: as_mlr
### Title: Convert to 'mlr'.
### Aliases: as_mlr

### ** Examples

data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
## Not run: library(mlr)
## Not run: nb_mlr <- as_mlr(nb, dag = FALSE, id = "ode_cl_aic")
## Not run: nb_mlr



