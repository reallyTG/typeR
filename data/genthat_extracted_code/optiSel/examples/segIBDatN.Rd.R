library(optiSel)


### Name: segIBDatN
### Title: Segment-Based Kinship at Native Alleles.
### Aliases: segIBDatN

### ** Examples

data(map)
data(Cattle)
dir     <- system.file("extdata", package = "optiSel")
files   <- paste(dir, "/Chr", 1:2, ".phased", sep="")
sKinatN <- segIBDatN(files, Cattle, map, thisBreed="Angler", 
                   ubFreq=0.01, minL=1.0, lowMem=FALSE)
               
## Mean kinship at native segments:
sKinatN$mean
#[1] 0.06695171

## Note that this can not be computed as mean(sKinatN$of).


## Results for individuals:
sKinatN$of <- sKinatN$Q1/sKinatN$Q2
sKinatN$of["Angler1","Angler5"]
#[1] 0.4394066

## Use temporary files to reduce working memory:

sKinatN <- segIBDatN(files, Cattle, map, thisBreed="Angler", ubFreq=0.01,  minL=1.0)
               
## Mean kinship at native segments:
sKinatN$mean
#[1] 0.06695171





