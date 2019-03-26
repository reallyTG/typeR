library(PHYLOGR)


### Name: read.phylog.matrix
### Title: Read a Phylogenetic Covariance Matrix
### Aliases: read.phylog.matrix
### Keywords: manip

### ** Examples

# First need to find where the example data sets are
 path.to.example <- paste(path.package(package="PHYLOGR"),"Examples/",sep="/") 



example.dsc.file <- paste(path.to.example,"ifsmi.dsc",sep="") 
phylog.matrix1 <- read.phylog.matrix(example.dsc.file)


# You could jump directly to the call to the function if you
# are willing to enter the path explicitly.
# For example in some Linux systems the following works
# read.phylog.matrix("/usr/lib/R/library/PHYLOGR/Examples/hb12n.dsc")
# In Windows, maybe do:
# read.phylog.matrix("c:\\progra~1\\rw1001\\library\\PHYLOGR\\Examples\\hb12n.dsc")







