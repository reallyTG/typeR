library(linkcomm)


### Name: plotLinkCommSummComm
### Title: Plot a Summary of the Link Communities
### Aliases: plotLinkCommSummComm

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Don't show: 
dev.off()
## End(Don't show)
## Plot the modularity of the link communities.
plot(lc, type = "commsumm", summary = "mod")



