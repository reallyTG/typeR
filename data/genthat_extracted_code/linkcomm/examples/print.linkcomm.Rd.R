library(linkcomm)


### Name: print.linkcomm
### Title: Print a Summary of a 'linkcomm' Object
### Aliases: print.linkcomm

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Print summary statistics to the screen.
print(lc)



