library(GENLIB)


### Name: gen.lineages
### Title: Create object of class GLgen for maternal or paternal lineages
### Aliases: gen.lineages
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi <- gen.genealogy(geneaJi)
genJi_MaLi<-gen.lineages(geneaJi, maternal = TRUE) 
genJi_FaLi<-gen.lineages(geneaJi, maternal = FALSE) 

## Not run: Plots of original genealogy and maternal and paternal lineages
layout(matrix(1:3,c(1,3),byrow=TRUE), widths =c(3,1,1), heights = 1)
gen.graph(genJi) 
mtext("Original", line=2)
gen.graph(genJi_MaLi) 
mtext("Maternal\nlineages", line=1)
gen.graph(genJi_FaLi) 
mtext("Paternal\nlineages", line=1)




