library(smaa)


### Name: smaa
### Title: One-stage SMAA analysis
### Aliases: smaa
### Keywords: SMAA

### ** Examples

N <- 1E4; m <- 2; n <- 3
meas <- dget(system.file("extdata/thrombo-meas.txt.gz", package="smaa"))

# Sample / read weights
## Not run: 
##D library(hitandrun)
##D pref <- simplex.sample(n, N)$samples
## End(Not run)
pref <- dget(system.file("extdata/thrombo-weights-nopref.txt.gz", package="smaa"))

# Calculate SMAA metrics
result <- smaa(meas, pref)
print(result)
plot(result)

result <- smaa(meas, c(0.5, 0.2, 0.3))
print(result)



