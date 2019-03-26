library(geneListPie)


### Name: geneListPie-package
### Title: Profiling a gene list into GOslim or KEGG function pie
### Aliases: geneListPie-package geneListPie
### Keywords: misc

### ** Examples

data(goslim.human.BP)
glist<-c("ABCB7","ABCF1","ABHD2","ACAD9","ACIN1","AMOTL1","ANLN","ANXA4","APBA2","APBA3","BAI3","BCLAF1","BEST1")
r<-geneListProfile(goslim.human.BP, glist, threshold=1)
labels<-sub("_", "__", r$labels) #remove the GO id labels for display, optional
labels<-sub(".*__", "", labels)
pie(r$sizes,labels=labels, main="GO Slim Biological Process Mapping")

##prepare a gene list in a single column or row
#glist<-load.genelist("genelist.txt", format="column")
##this is how to load a customize gene set in a file
#gs<-load.genesets("customized-genesets.txt")
#r<-geneListProfile(gs, glist, threshold=5)
#library(plotrix)
#pie3D(r$sizes,labels=r$labels, main="customized Mapping")
#printGeneListProfile(r)



