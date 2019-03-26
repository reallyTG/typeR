library(seqRFLP)


### Name: read.nxs
### Title: Read nexus file
### Aliases: read.nxs
### Keywords: nexus read

### ** Examples


#####
##### read.nxs() example
data(fil.nxs)
writeLines(fil.nxs, "example.nxs")
nxs <- read.nxs("example.nxs")
as.fasta(nxs)
unlink("example.nxs")




