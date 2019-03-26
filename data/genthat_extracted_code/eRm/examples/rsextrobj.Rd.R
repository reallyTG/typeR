library(eRm)


### Name: rsextrobj
### Title: Extracting Encoded Sample Matrices
### Aliases: rsextrobj
### Keywords: misc

### ** Examples

ctr <- rsctrl(burn_in = 10, n_eff = 3, step=10, seed = 0, tfixed = FALSE)
mat <- matrix(sample(c(0,1), 50, replace = TRUE), nr = 10)
all_m <- rsampler(mat, ctr)
summary(all_m)

some_m <- rsextrobj(all_m, 1, 2)
summary(some_m)

## Not run: 
##D save(some_m, file = "some.RSobj.RData")
##D rm(some_m)
##D ls()
##D 
##D load("some.RSobj.RData")
##D summary(some_m)
## End(Not run)



