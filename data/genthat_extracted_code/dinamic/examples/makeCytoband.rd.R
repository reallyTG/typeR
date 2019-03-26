library(dinamic)


### Name: makeCytoband
### Title: Find the Chromosome Arm for Each Marker
### Aliases: makeCytoband
### Keywords: manip

### ** Examples

data(wilms.markers)
data(annot.file)
wilms.pq = makeCytoband(wilms.markers, annot.file)
#A character vector of length 3288, and each entry is either
#"p" or "q", depending on the chromosome arm of the given marker.
table(wilms.pq)
#Produces the following output:
#wilms.pq
#1147 2141 



