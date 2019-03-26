library(msde)


### Name: sde.examples
### Title: Example SDE models.
### Aliases: sde.examples

### ** Examples

# Heston's model
hmod <- sde.examples("hest") # load pre-compiled model

# inspect model's C++ code
hfile <- sde.examples("hest", file.only = TRUE)
cat(readLines(hfile), sep = "\n")

## Not run: 
##D # compile it from scratch
##D param.names <- c("alpha", "gamma", "beta", "sigma", "rho")
##D data.names <- c("X", "Z")
##D hmod <- sde.make.model(ModelFile = hfile,
##D                        param.names = param.names,
##D                        data.names = data.names)
## End(Not run)



