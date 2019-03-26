library(optiSel)


### Name: segBreedComp
### Title: Calculates the Segment-Based Breed Composition of Individuals
### Aliases: segBreedComp

### ** Examples

data(map)
data(Cattle)
dir     <- system.file("extdata", package = "optiSel")
GTfiles <- file.path(dir, paste("Chr", unique(map$Chr), ".phased", sep=""))
Haplo   <- haplofreq(GTfiles, Cattle, map, thisBreed="Angler", minSNP=20, minL=1.0)
Comp    <- segBreedComp(Haplo$freq<0.01, map)
mean(Comp$native)
#[1] 0.3853432

Comp <- segBreedComp(Haplo$match, map)
apply(Comp[, -1], 2, mean)

## Reading native segments from files:
## Not run: 
##D wdir <- file.path(tempdir(), "HaplotypeEval")
##D file <- haplofreq(GTfiles, Cattle, map, thisBreed="Angler", minSNP=20, 
##D            minL=1.0, ubFreq=0.01, what="match", w.dir=wdir)
##D Comp <- segBreedComp(file$match, map)
##D head(Comp)
##D 
##D apply(Comp[, -1], 2, mean)
##D #    native          F          H          R 
##D #0.38534317 0.05503451 0.25986508 0.29975724 
##D 
##D #unlink(wdir, recursive = TRUE)
## End(Not run)



