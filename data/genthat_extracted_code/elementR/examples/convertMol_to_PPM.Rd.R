library(elementR)


### Name: convertMol_to_PPM
### Title: convertMol_to_PPM
### Aliases: convertMol_to_PPM

### ** Examples

## Convert the file Example1_replicate1.csv included in the package from Mol/Mol into ppm/ppm

# indicate the path and read the file to be converted
filePath <- system.file("Example_conversion/Ex1/Example1_Replicate1.csv", package="elementR")

dat <- readData(filePath, sep = ",", dec = ".")

# indicate the path and read the file containing the atomic weight of the elements
AtomWeightPath <- system.file("AtomicMass.csv", package="elementR")

AtomicMass <- readData(AtomWeightPath, sep = ",", dec = ".")

# set the internal standard
InternStand <- "Ca43"

standard <- convertMol_to_PPM(dat, AtomicMass, InternStand)

## Display the converted data 
standard



