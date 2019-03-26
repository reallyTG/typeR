library(PHYLOGR)


### Name: read.pdi.data
### Title: Read Pdi Data Files
### Aliases: read.pdi.data
### Keywords: manip file

### ** Examples



# This works under both Unix and Windows.
# First need to find out where the ''Examples'' directory is located.
path.to.example <- paste(path.package(package="PHYLOGR"),"Examples/",sep="/") 



# a simple case
p49a <- paste(path.to.example,"49lbr.pdi",sep="")
data.49a <- read.pdi.data(p49a)
data.49a

# two files and rename columns
p49b <- paste(path.to.example,"49hmt.pdi",sep="")
data.49.2 <- read.pdi.data(c(p49a,p49b),variable.names=c("y","x1","x2","x3"))
data.49.2

# You could jump directly to the call to the function if you
# are willing to enter the path explicitly.
# For example in some Linux systems the following works
# read.pdi.data("/usr/lib/R/library/PHYLOGR/Examples/49lbr.pdi")
# In Windows, maybe do:
# read.pdi.data("c:\\progra~1\\rw1001\\library\\PHYLOGR\\Examples\\49lbr.pdi")




