library(smaa)


### Name: smaa.values
### Title: SMAA alternative values
### Aliases: smaa.values

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))

# Sample / read weights
## Not run: 
##D library(hitandrun)
##D pref <- simplex.sample(n, N)$samples
## End(Not run)
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate alternative values
values <- smaa.values(meas, pref)
summary(values)
plot(values)

values.expected <- dget(system.file("extdata/thrombo-values-nopref.txt.gz", package="smaa"))
stopifnot(all.equal(values, values.expected))



