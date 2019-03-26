library(PPforest)


### Name: baggtree
### Title: For each bootstrap sample grow a projection pursuit tree (PPtree
###   object).
### Aliases: baggtree

### ** Examples

#crab data set
crab.trees <- baggtree(data = crab, class = 'Type',
m =  200, PPmethod = 'LDA', lambda = .1, size.p = 0.5 , parallel = TRUE, cores = 2)
str(crab.trees, max.level = 1)




