library(Claddis)


### Name: WriteMorphNexus
### Title: Writes out a morphological #NEXUS data file
### Aliases: WriteMorphNexus
### Keywords: NEXUS

### ** Examples


# Write out Michaux 1989 to current working directory:
WriteMorphNexus(CladisticMatrix = Michaux1989, filename = "Michaux1989.nex")

# Remove file when finished:
file.remove("Michaux1989.nex")




