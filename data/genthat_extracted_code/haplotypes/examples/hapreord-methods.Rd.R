library(haplotypes)


### Name: hapreord-methods
### Title: Reorders haplotypes according to the ordering factor
### Aliases: hapreord hapreord-methods hapreord,Haplotype-method
### Keywords: HAPLOTYPE ANALYSIS

### ** Examples

data("dna.obj")
x<-dna.obj[1:6,,as.matrix=FALSE]
# inferring haplotypes from DNA sequences
h<-haplotype(x)

## Reordering haplotypes.

# length of the argument 'order' is equal to the number of haplotypes
rh<-hapreord(h,order=c(4,3,1,2))
rh




