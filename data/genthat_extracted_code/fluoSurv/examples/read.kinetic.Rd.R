library(fluoSurv)


### Name: read.kinetic
### Title: Reads a kinetic file, as produced by a Biotek plate reader.
### Aliases: read.kinetic

### ** Examples

## reads data. Warning: files are large, and this operation takes time!
d <- read.kinetic("kinetics_xenorhabdus_galleria.txt",
                     path=system.file('extdata', package = 'fluoSurv'),
                     saveData=FALSE)
str(d)

## saveData should rather be set to TRUE so that converted data are saved
## in a csv file and can be re-used later on.




