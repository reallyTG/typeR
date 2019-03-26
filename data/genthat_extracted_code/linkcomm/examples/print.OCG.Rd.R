library(linkcomm)


### Name: print.OCG
### Title: Print a Summary of an 'OCG' Object
### Aliases: print.OCG

### ** Examples

## Generate graph and extract OCG communities.
g <- swiss[,3:4]
oc <- getOCG.clusters(g)

## Print summary statistics to the screen.
print(oc)



