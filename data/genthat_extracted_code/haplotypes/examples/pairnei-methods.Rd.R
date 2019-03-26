library(haplotypes)


### Name: pairnei-methods
### Title: Provides the average number of pairwise Nei's (D) differences
###   between populations
### Aliases: pairnei pairnei-methods pairnei,Dna-method pairnei,dist-method
###   pairnei,matrix-method
### Keywords: DNA ANALYSIS

### ** Examples

data("dna.obj")
x<-dna.obj[1:6,,as.matrix=FALSE]
populations<-c("pop1","pop1","pop2","pop3","pop3","pop3") 

## Method for signature 'Dna'.
pairnei(x, populations)

## Method for signature 'dist'.
d<-distance(x)
pairnei(d, populations)

## Method for signature 'matrix'.
d<-as.matrix(distance(x))
pairnei(d, populations)





