library(RRphylo)


### Name: distNodes
### Title: Finding distance between nodes and tips
### Aliases: distNodes

### ** Examples

## No test: 
data("DataApes")
DataApes$Tstage->Tstage

distNodes(tree=Tstage)
distNodes(tree=Tstage,node=64)
distNodes(tree=Tstage,node="Tro_2")
distNodes(tree=Tstage,node=c(64,48))
distNodes(tree=Tstage,node=c(64,"Tro_2"))
## End(No test)



