library(haplotypes)


### Name: grouping-methods
### Title: Groups haplotypes according to the grouping variable
###   (populations, species, etc.)
### Aliases: grouping grouping-methods grouping,Haplotype-method
### Keywords: HAPLOTYPE ANALYSIS

### ** Examples

data("dna.obj")
x<-dna.obj[1:6,,as.matrix=FALSE]
# inferring haplotypes from DNA sequences
h<-haplotype(x) 

## Grouping haplotypes.
# character vector 'populations' is a grouping factor.
populations<-c("pop1","pop1","pop2","pop3","pop3","pop3") 


# length of the argument 'factor' is equal to the number of sequences
g<-grouping(h,factor=populations) 

# length of the returned component 'hapvec' is equal to the number of sequences
g




