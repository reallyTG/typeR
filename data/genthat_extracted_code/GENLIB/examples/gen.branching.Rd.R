library(GENLIB)


### Name: gen.branching
### Title: Genealogy subset
### Aliases: gen.branching
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi)
genJi_part<-gen.branching(genJi,pro=c(2,28)) 

## Not run: Plots of original genealogy and of the branched version
layout(matrix(1:2,c(1,2),byrow=TRUE))
gen.graph(genJi) 
mtext("Original", line=2, cex=1.2)
gen.graph(genJi_part) 
mtext("Branched tree\nfor individuals 2 and 28", line=1, cex=1.2)




