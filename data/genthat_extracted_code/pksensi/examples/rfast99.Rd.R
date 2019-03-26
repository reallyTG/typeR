library(pksensi)


### Name: rfast99
### Title: Extended Fourier Amplitude Sensitivity Test with Random Phase
###   Shift
### Aliases: rfast99

### ** Examples

# Generate the parameter matrix with 20 replications
q <- "qunif"
q.arg <- list(min = 0, max = 1)

set.seed(1234)
x <- rfast99(params = 3, n = 100, replicate = 20, q = q, q.arg = q.arg)
dim(x$a) # the array of c(model evaluation, replication, parameters).

## Not run: 
##D save(x, file = "input_parameters.rda")
## End(Not run)




