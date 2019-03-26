library(haplotypes)


### Name: distance-methods
### Title: Calculates absolute pairwise character difference matrix using a
###   'Dna' object
### Aliases: distance distance-methods distance,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples

data("dna.obj")
x<-dna.obj[4:7,13:22,as.matrix=FALSE]

## Simple indel coding.
distance(x,indels="s")

## Gaps as 5th state characters.
distance(x,indels="5")

## Gaps as missing characters.
distance(x,indels="m")

## Not run: 
##D ## Using 'subset'.
##D x<-dna.obj[4:10,13:22,as.matrix=FALSE]
##D distance(x, NULL)
##D distance(x, subset=c(1))
##D distance(x, subset=c(2,4))
## End(Not run)



