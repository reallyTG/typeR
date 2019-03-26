library(Claddis)


### Name: WriteMorphTNT
### Title: Writes out a morphological TNT data file
### Aliases: WriteMorphTNT
### Keywords: TNT

### ** Examples


# Write out Michaux 1989 to current working directory:
WriteMorphTNT(CladisticMatrix = Michaux1989, filename = "Michaux1989.tnt")

# Remove file when finished:
file.remove("Michaux1989.tnt")




