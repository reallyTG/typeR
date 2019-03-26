library(pysd2r)


### Name: set_components
### Title: Changes a model parameter
### Aliases: set_components

### ** Examples

## Not run: 
##D target <- system.file("models/vensim", "Population.mdl", package = "pysd2r")
##D py <- pysd_connect()
##D py <- read_vensim(py, target)
##D results <- run_model(py)
##D l <- list("Growth Fraction"=0.02)
##D set_components(py,l)
##D out2 <- run_model(py)
## End(Not run)



