library(CommEcol)


### Name: treeNodf
### Title: Tree-like Nestedness of Ecological Metacommunities
### Aliases: treeNodf treeNodfTest

### ** Examples

library(picante)
data(sites5.6)
data(tree6)
treeNodf    (sites5.6, col.tree=tree6)
# You likely will need more runs in your permutation test.
treeNodfTest(sites5.6, col.tree=tree6, null.model="perm.rows", permutations=9)

alt5 <- vegdist(1:5, method="euclidean")
alt5 <- hclust(alt5)
alt5 <- as.phylo(alt5)
alt5$tip.label<-rownames(sites5.6)
treeNodf    (sites5.6, row.tree=alt5)
#treeNodfTest(sites5.6, row.tree=alt5, null.model="perm.cols",permutations=99)

treeNodf    (sites5.6, col.tree=tree6, row.tree=alt5)
#treeNodfTest(sites5.6, col.tree=tree6, row.tree=alt5, null.model="perm.rc", permutations=99)
#treeNodfTest(sites5.6, col.tree=tree6, row.tree=alt5, null.model="ff", permutations=99)

# In the example below treeNodf is zero because PD of the first sample is 
# lower than that of the second sample. Notice samples have the same species 
# richness and higher PD for the first sample is due to the presence of a
# distinctive species (e).
tree <- read.tree(text="(((a:1,b:1):1,(c:1,d:1):1):2, e:4);")
plot(tree)
mat  <- matrix(c(1,1,1,1,0, 1,1,1,0,1), byrow=TRUE, nrow=2, dimnames=list(1:2, letters[1:5]))
mat
pd(mat, tree)
treeNodf(mat, tree) 

# Here treeNodf is non-zero... but you would only do that if you have
# an 'a priori' hypothesis to order rows of your matrix this way!
treeNodf(mat[2:1, ], tree) 



