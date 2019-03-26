library(PHYLOGR)


### Name: read.inp.data
### Title: Read Inp Data Files
### Aliases: read.inp.data
### Keywords: manip file

### ** Examples


# This works under both Unix and Windows.
# First need to find out where the ''Examples'' directory is located.
path.to.example <- paste(path.package(package="PHYLOGR"),"Examples/",sep="/") 



# a simple case
p49a <- paste(path.to.example,"49lbr.inp",sep="")
data.49a <- read.inp.data(p49a)
data.49a

# two files and rename columns
p49b <- paste(path.to.example,"49hmt.inp",sep="")
data.49.2 <- read.inp.data(c(p49a,p49b),variable.names=c("y","x1","x2","x3"))
data.49.2

# You could jump directly to the call to the function if you
# are willing to enter the path explicitly.
# For example in some Linux systems the following works
# read.inp.data("/usr/lib/R/library/PHYLOGR/Examples/49lbr.inp")
# In Windows, maybe do:
# read.inp.data("c:\\progra~1\\rw1001\\library\\PHYLOGR\\Examples\\49lbr.inp")





