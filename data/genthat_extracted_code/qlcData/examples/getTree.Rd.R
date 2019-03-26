library(qlcData)


### Name: getTree
### Title: Extract parts out of the full Glottolog 2016 tree
### Aliases: getTree

### ** Examples

# use getTree() to select genealogical parts of the data
data(glottolog)

( aalawa <- getTree(up = "aala1237", kind = "glottocode") )
( kandas <- getTree(down = "Kandas-Duke of York") )
( treeFull <- getTree(up = c("deu", "eng", "ind", "cha"), kind = "iso") )
( treeReduced <- getTree(up = c("deu", "eng", "ind", "cha"), kind = "iso", reduce = TRUE) )

## Not run: 
##D # use FromDataFrameNetwork() to visualize the tree
##D # and export it into various other tree formats in R
##D 
##D library(data.tree)
##D treeF <- FromDataFrameNetwork(treeFull)
##D treeR <- FromDataFrameNetwork(treeReduced)
##D 
##D plot(treeF)
##D plot(treeR)
##D 
##D # turn into phylo format from library 'ape'
##D t <- as.phylo.Node(treeR)
##D plot(t)
##D 
##D # turn into dendrogram
##D t <- as.dendrogram(treeF)
##D plot(t, center = T)
## End(Not run)



