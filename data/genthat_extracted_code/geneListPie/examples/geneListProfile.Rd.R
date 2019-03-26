library(geneListPie)


### Name: geneListProfile
### Title: Profling a gene list against gene sets
### Aliases: geneListProfile

### ** Examples

data(goslim.human.BP)
glist<-c("ABCB7","ABCF1","ABHD2","ACAD9","ACIN1","AMOTL1","ANLN","ANXA4","APBA2","APBA3","BAI3","BCLAF1","BEST1")
r<-geneListProfile(goslim.human.BP, glist, threshold=1)
labels<-sub("_", "__", r$labels) #remove the GO id labels for display, optional
labels<-sub(".*__", "", labels)
pie(r$sizes,labels=labels, main="GO Slim Biological Process Mapping")



