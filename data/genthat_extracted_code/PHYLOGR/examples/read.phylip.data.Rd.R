library(PHYLOGR)


### Name: read.phylip.data
### Title: Read Phylip Infile Data Files
### Aliases: read.phylip.data
### Keywords: manip file

### ** Examples



# This works under both Unix and Windows.
# First need to find out where the ''Examples'' directory is located.
path.to.example <- paste(path.package(package="PHYLOGR"),"Examples/",sep="/") 



lacertid.data.name <- paste(path.to.example,"LacertidData.PhylipInfile",sep="")
lacertid.data <- read.phylip.data(lacertid.data.name,variable.names=c("svl", "svl.matur",
                                  "hatsvl", "hatweight", "clutch.size",
                                  "age.mat", "cl.freq", "xx"))
lacertid.data

# You could jump directly to the call to the function if you
# are willing to enter the path explicitly.
# For example in some Linux systems the following works
# read.phylip.data("/usr/lib/R/library/PHYLOGR/Examples/LacertidData.PhylipInfile")
# In Windows, maybe do:
# read.pdi.data("c:\\progra~1\\rw1001\\library\\PHYLOGR\\Examples\\LacertidData.PhylipInfile")




