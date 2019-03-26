library(MALDIquantForeign)


### Name: MALDIquantForeign-parallel
### Title: Parallel Support in Package 'MALDIquantForeign'
### Aliases: MALDIquantForeign-parallel
### Keywords: misc

### ** Examples

 ## load packages
 library("MALDIquant")
 library("MALDIquantForeign")

 exampleDirectory <- system.file("exampledata", package="MALDIquantForeign")

 ## run single-core import
 print(system.time(
   s1 <- importMzMl(exampleDirectory, centroided=TRUE, verbose=FALSE)
 ))

 if(.Platform$OS.type == "unix") {
   ## run multi-core import
   ## (because the example spectra are very small (just 5 data points) the
   ## multi-core solution is slower on most systems)
   print(system.time(
     s2 <- importMzMl(exampleDirectory, centroided=TRUE, mc.cores=2,
                      verbose=FALSE)
   ))
   stopifnot(all.equal(s1, s2))
 }



