library(BaSTA)


### Name: multibasta
### Title: Function to run multiple BaSTA models on the same dataset.
### Aliases: multibasta summary.multibasta print.multibasta
### Keywords: methods

### ** Examples

## Load data:
data("sim1", package = "BaSTA")

## Run short version of BaSTA on the data:
multiout <- multibasta(sim1, studyStart = 51, studyEnd = 70, 
                 models = c("GO", "WE"), shapes = "simple",
                 niter = 200, burnin = 11, thinning = 10, 
                 nsim = 1, updateJumps = FALSE, parallel = FALSE)

## Print results:
summary(multiout, digits = 3)



