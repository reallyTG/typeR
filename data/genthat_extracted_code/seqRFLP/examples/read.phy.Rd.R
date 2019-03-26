library(seqRFLP)


### Name: read.phy
### Title: Read phylip file
### Aliases: read.phy
### Keywords: phylip read

### ** Examples

##### read.phy() example
data(fil.phy)
writeLines(fil.phy, "example.phy")
phy <- read.phy("example.phy")
as.fasta(phy)
unlink("example.phy")



