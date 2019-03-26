library(linkcomm)


### Name: linkcomm2clustnsee
### Title: Write a Partition File for Clust&See
### Aliases: linkcomm2clustnsee

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Write a partition file to disk.
linkcomm2clustnsee(lc)

## Extract OCG communities.
oc <- getOCG.clusters(g)

## Write a partition file to disk.
linkcomm2clustnsee(oc)




