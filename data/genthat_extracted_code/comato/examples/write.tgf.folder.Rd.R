library(comato)


### Name: write.tgf.folder
### Title: Saving a set of concept maps to TGF files
### Aliases: write.tgf.folder

### ** Examples

## Not run: 
##D #Create concept maps from three random graphs
##D require("igraph")
##D g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
##D g2 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
##D g3 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
##D 
##D #Create conceptmaps object from three conceptmap objects
##D simple_cms = conceptmaps(list(conceptmap(g1), conceptmap(g2), conceptmap(g3)))
##D 
##D write.tgf.folder(simple_cms, "~/cmaps")
## End(Not run)



