library(optiSel)


### Name: haplofreq
### Title: Evaluates the Occurrence of Haplotype Segments in Particular
###   Breeds
### Aliases: haplofreq

### ** Examples

data(map)
data(Cattle)
dir   <- system.file("extdata", package="optiSel")
files <- file.path(dir, paste("Chr", 1:2, ".phased", sep=""))

Freq <- freqlist(
 haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Rotbunt",   minL=2.0),
 haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Holstein",  minL=2.0),
 haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Fleckvieh", minL=2.0)
  )

plot(Freq, ID=1, hap=2, refBreed="Rotbunt")
plot(Freq, ID=1, hap=2, refBreed="Holstein", Chr=1)

## Not run: 
##D ## Test for using multiple cores:
##D 
##D Freq1 <- haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Rotbunt", 
##D                    minL=2.0, cores=NA)$freq
##D range(Freq[[1]]-Freq1)
##D #[1] 0 0
## End(Not run)

## Creating output files with allele frequencies and allele origins:
## Not run: 
##D rdir  <- system.file("extdata", package = "optiSel")
##D wdir  <- file.path(tempdir(), "HaplotypeEval")
##D chr   <- unique(map$Chr)
##D files <- file.path(rdir, paste("Chr", chr, ".phased", sep=""))
##D wfile <- haplofreq(files, Cattle, map, thisBreed="Angler", minL=2.0, w.dir=wdir)
##D 
##D View(read.table(wfile$match[1],skip=1))
##D #unlink(wdir, recursive = TRUE)
## End(Not run)




