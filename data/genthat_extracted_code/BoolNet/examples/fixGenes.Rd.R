library(BoolNet)


### Name: fixGenes
### Title: Simulate knocked-out or over-expressed genes
### Aliases: fixGenes
### Keywords: Boolean network probabilistic Boolean network PBN knock-out
###   over-expression fixed gene fix

### ** Examples

# load example data
data(cellcycle)

# knock out gene CycD (index 1)
net <- fixGenes(cellcycle, 1, 0)
# or
net <- fixGenes(cellcycle, "CycD", 0)

# get attractors by exhaustive search
attractors <- getAttractors(net)

print(attractors)



