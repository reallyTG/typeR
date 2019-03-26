library(elementR)


### Name: convertPPM_to_Mol
### Title: convertPPM_to_Mol
### Aliases: convertPPM_to_Mol

### ** Examples

## Convert the file Example1_replicate1.csv included in the package from ppm/ppm into Mol/Mol 

# indicate the path and read the file to be converted
filePath <- system.file("Example_conversion/Example2_Replicate1.csv", package="elementR")

dat <- readData(filePath, sep = ",", dec = ".")

# indicate the path and read the file containing the atomic weight of the elements
AtomWeightPath <- system.file("AtomicMass.csv", package="elementR")

AtomicMass <- readData(AtomWeightPath, sep = ",", dec = ".")

# set the internal standard
InternStand <- "Ca43"

standard <- convertPPM_to_Mol(dat, AtomicMass, InternStand)

## Display the converted data 
standard



