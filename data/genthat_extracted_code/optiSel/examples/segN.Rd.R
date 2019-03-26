library(optiSel)


### Name: segN
### Title: Calculates Probabilities of Alleles to belong to Native Segments
### Aliases: segN

### ** Examples

data(map)
data(Cattle)
dir   <- system.file("extdata", package = "optiSel")
files <- file.path(dir, paste("Chr", unique(map$Chr), ".phased", sep=""))
Freq  <- haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="others", minSNP=20)$freq
fN   <- segN(Freq<0.01, map)
mean(fN)
#[1] 0.15418

## Not run: 
##D fN   <- segN(Freq<0.01, map, cores=NA)
##D mean(fN)
##D #[1] 0.15418
## End(Not run)


## using files:
## Not run: 
##D wdir   <- file.path(tempdir(),"HaplotypeEval")
##D chr    <- unique(map$Chr)
##D GTfile <- file.path( dir, paste("Chr", chr, ".phased",     sep=""))
##D files  <- haplofreq(GTfile, Cattle, map, thisBreed="Angler", w.dir=wdir)
##D 
##D fN     <- segN(files$match, map)
##D mean(fN)
##D #[1] 0.15418
##D 
##D fN     <- segN(files$match, map, cores=NA)
##D mean(fN)
##D #[1] 0.15418
##D 
##D #unlink(wdir, recursive = TRUE)
## End(Not run)





