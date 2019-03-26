library(pysd2r)


### Name: reload_model
### Title: Reloads the model from original mdl file
### Aliases: reload_model

### ** Examples

## Not run: 
##D target <- system.file("models/vensim", "Population.mdl", package = "pysd2r")
##D py <- pysd_connect()
##D py <- read_vensim(py, target)
##D set_time_values(py,0,10,0.5)
##D py<-reload_model(py)
## End(Not run)



