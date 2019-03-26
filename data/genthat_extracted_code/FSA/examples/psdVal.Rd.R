library(FSA)


### Name: psdVal
### Title: Finds Gabelhouse lengths (for PSD calculations) for a species.
### Aliases: psdVal
### Keywords: manip

### ** Examples

# List all of the species
psdVal()
# Demonstrate typical usages
psdVal("Yellow perch")
psdVal("Walleye",units="cm")
psdVal("Bluegill",units="in")
psdVal("Bluegill",units="in",incl.zero=FALSE)
psdVal("Bluegill")
# Demonstrate that it will work with mis-capitalization
psdVal("bluegill")
psdVal("Yellow Perch")
# Demonstrate adding in user-defined categories
psdVal("Bluegill",units="in",addLens=7)
psdVal("Bluegill",units="in",addLens=7,addNames="MinLen")
psdVal("Bluegill",units="in",addLens=c(7,9),addNames=c("MinSlot","MaxSlot"))
psdVal("Bluegill",units="in",addLens=c("MinLen"=7))
psdVal("Bluegill",units="in",addLens=c("MinSlot"=7,"MaxSlot"=9))




