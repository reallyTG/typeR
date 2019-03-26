library(netdiffuseR)


### Name: recode
### Title: Recodes an edgelist such that ids go from 1 to n
### Aliases: recode recode.data.frame recode.matrix
### Keywords: misc

### ** Examples

# Simple example ------------------------------------------------------------
edgelist <- cbind(c(1,1,3,6),c(4,3,200,1))
edgelist
recoded_edgelist <- recode(edgelist)
recoded_edgelist

# Retrieving the "recode" attribute
attr(recoded_edgelist, "recode")



