library(haplotypes)


### Name: as.matrix-methods
### Title: Methods for function 'as.matrix' in the Package 'haplotypes'
### Aliases: as.matrix as.matrix-methods as.matrix,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples

data("dna.obj")

## Coercing a 'Dna' object to a matrix.
x<-dna.obj[1:4,1:6,as.matrix=FALSE]
x
as.matrix(x)

## Not run: 
##D # gives the same result
##D dna.obj[1:4,1:6,as.matrix=TRUE] 
## End(Not run)




