library(msde)


### Name: sde.make.model
### Title: Create an SDE model object.
### Aliases: sde.make.model

### ** Examples

# header (C++) file for Heston's model
hfile <- sde.examples("hest", file.only = TRUE)
cat(readLines(hfile), sep = "\n")

## No test: 
# compile the model
param.names <- c("alpha", "gamma", "beta", "sigma", "rho")
data.names <- c("X", "Z")
hmod <- sde.make.model(ModelFile = hfile,
                       param.names = param.names,
                       data.names = data.names)

hmod
## End(No test)



