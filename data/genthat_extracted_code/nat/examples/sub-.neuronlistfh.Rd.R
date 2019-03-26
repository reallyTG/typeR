library(nat)


### Name: [.neuronlistfh
### Title: Extract from neuronlistfh object or its attached data.frame
### Aliases: [.neuronlistfh

### ** Examples

# make a test neuronlistfh backed by a temporary folder on disk
tf=tempfile('kcs20fh')
kcs20fh<-as.neuronlistfh(kcs20, dbdir=tf)

# get first neurons as an in memory neuronlist
class(kcs20fh[1:3])

# extract attached data.frame
str(kcs20fh[,])
# or part of the data.frame
str(kcs20fh[1:2,1:3])

# data.frame assignment (this one changes nothing)
kcs20fh[1:2,'gene_name'] <- kcs20fh[1:2,'gene_name']

# clean up
unlink(tf, recursive=TRUE)




