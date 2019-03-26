library(phylolm)


### Name: test.one.species.tree
### Title: Tests the fit of a population tree to quartet concordance factor
###   data
### Aliases: test.one.species.tree

### ** Examples

data(quartetCF)
data(guidetree)
## No test: 
prelim <- test.tree.preparation(quartetCF,guidetree) # takes 5-10 seconds

# test of panmixia: all edges collapsed, none resolved.
panmixia <- test.one.species.tree(quartetCF,guidetree,prelim,edge.keep=NULL)
panmixia[1:6]

# test of full tree: all internal edges resolved, none collapsed.
Ntaxa = length(guidetree$tip.label)
# indices of internal edges:
internal.edges = which(guidetree$edge[,2] > Ntaxa)
fulltree <- test.one.species.tree(quartetCF,guidetree,prelim,edge.keep=internal.edges)
fulltree[1:6]

# test of a partial tree, some edges (but not all) collapsed
edges2keep <- c(1,2,4,6,7,8,11,14,20,21,23,24,31,34,35,36,38,39,44,47,53)
partialTree <- test.one.species.tree(quartetCF,guidetree,prelim,edge.keep=edges2keep)
partialTree[1:5]
partialTree$outlier.table
# identify taxa most responsible for the extra outlier quartets
outlier.4taxa <- which(partialTree$outlier.pvalues < 0.01)
length(outlier.4taxa) # 483 4-taxon sets with outlier p-value below 0.01
q01 = as.matrix(quartetCF[outlier.4taxa,1:4])
sort(table(as.vector(q01)),decreasing=TRUE)
# So: Cnt_1 and Vind_1 both appear in 239 of these 483 outlier 4-taxon sets.
sum(apply(q01,1,function(x){"Cnt_1" %in% x | "Vind_1" %in% x}))
# 266 outlier 4-taxon sets have either Cnt_1 or Vind_1
sum(apply(q01,1,function(x){"Cnt_1" %in% x & "Vind_1" %in% x}))
# 212 outlier 4-taxon sets have both Cnt_1 and Vind_1
## End(No test)



