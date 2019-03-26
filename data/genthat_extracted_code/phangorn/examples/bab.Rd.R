library(phangorn)


### Name: bab
### Title: Branch and bound for finding all most parsimonious trees
### Aliases: bab BranchAndBound
### Keywords: cluster ~kwd2

### ** Examples


data(yeast)
dfactorial(11)
# choose only the first two genes
gene12 <- subset(yeast, , 1:3158, site.pattern=FALSE) 
trees <- bab(gene12)




