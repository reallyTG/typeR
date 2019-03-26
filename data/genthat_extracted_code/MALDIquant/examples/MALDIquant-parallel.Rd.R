library(MALDIquant)


### Name: MALDIquant-parallel
### Title: Parallel Support in Package 'MALDIquant'
### Aliases: MALDIquant-parallel
### Keywords: misc

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## run single-core baseline correction
print(system.time(
  b1 <- removeBaseline(fiedler2009subset, method="SNIP")
))

if(.Platform$OS.type == "unix") {
  ## run multi-core baseline correction
  print(system.time(
    b2 <- removeBaseline(fiedler2009subset, method="SNIP", mc.cores=2)
  ))
  stopifnot(all.equal(b1, b2))
}

## parallelise complete workflow
workflow <- function(spectra, cores) {
  s <- transformIntensity(spectra, method="sqrt", mc.cores=cores)
  s <- smoothIntensity(s, method="SavitzkyGolay", halfWindowSize=10,
                       mc.cores=cores)
  s <- removeBaseline(s, method="SNIP", iterations=100, mc.cores=cores)
  s <- calibrateIntensity(s, method="TIC", mc.cores=cores)
  detectPeaks(s, method="MAD", halfWindowSize=20, SNR=2, mc.cores=cores)
}

if(.Platform$OS.type == "unix") {
  ## parallelise the complete workflow is often faster because the overhead is
  ## reduced
  print(system.time(
    p1 <- unlist(parallel::mclapply(fiedler2009subset,
                                    function(x)workflow(list(x), cores=1),
                                    mc.cores=2), use.names=FALSE)
  ))
  print(system.time(
    p2 <- workflow(fiedler2009subset, cores=2)
  ))
  stopifnot(all.equal(p1, p2))
}




