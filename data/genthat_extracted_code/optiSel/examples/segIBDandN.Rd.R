library(optiSel)


### Name: segIBDandN
### Title: Calculates Probabilities that Alleles belong to a Shared Native
###   Segment
### Aliases: segIBDandN

### ** Examples

data(map)
data(Cattle)
dir    <- system.file("extdata", package = "optiSel")
GTfile <- file.path(dir, paste("Chr", unique(map$Chr), ".phased", sep=""))
Freq   <- haplofreq(GTfile, Cattle, map, thisBreed="Angler", refBreeds="others", minSNP=20)$freq

fIBDN  <- segIBDandN(GTfile, Freq<0.01, map=map, minSNP=20)
mean(fIBDN)
#[1] 0.01032261

## Not run: 
##D fIBDN  <- segIBDandN(GTfile, Freq<0.01, map=map, minSNP=20, cores=NA)
##D mean(fIBDN)
##D #[1] 0.01032261
## End(Not run)

## using files:
## Not run: 
##D wdir   <- file.path(tempdir(),"HaplotypeEval")
##D chr    <- unique(map$Chr)
##D GTfile <- file.path( dir, paste("Chr", chr, ".phased",     sep=""))
##D file   <- haplofreq(GTfile, Cattle, map, thisBreed="Angler", minSNP=20, ubFreq=0.01, w.dir=wdir)
##D 
##D fIBDN  <- segIBDandN(GTfile, file$match, map=map, minSNP=20)
##D mean(fIBDN)
##D #[1] 0.01032261
##D 
##D fIBDN  <- segIBDandN(GTfile, file$match, map=map, minSNP=20, cores=NA)
##D mean(fIBDN)
##D #[1] 0.01032261
##D 
##D 
##D #unlink(wdir, recursive = TRUE)
## End(Not run)




