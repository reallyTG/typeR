library(ips)


### Name: write.partitioned.nex
### Title: Write partitioned and commented NEXUS files
### Aliases: write.partitioned.nex

### ** Examples

# load sequence data and split in three parts
# -------------------------------------------
data(woodmouse)
w1 <- woodmouse[, 1:250]
w2 <- woodmouse[, 251:750]
w3 <- woodmouse[, 750:965]

# write nexus file with taxon block
# ---------------------------------
markers <- c("gene1", "gene2", "gene3")
write.partitioned.nex(w1, w2, w3, labels = markers)



