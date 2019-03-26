library(DGM)


### Name: subject
### Title: Estimate subject's full network: runs exhaustive search on very
###   node.
### Aliases: subject

### ** Examples

data("utestdata")
# select only 3-nodes to speed-up this example
sub=subject(myts[,1:3]) 
sub=subject(myts[,1:3], method="both")




