library(haplotypes)


### Name: as.numeric-methods
### Title: Coerces a 'Dna' object to a numeric matrix
### Aliases: as.numeric as.numeric-methods as.numeric,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples

x<-matrix(c("?","A","C","g","t","-","0","1","2","3","4","5"),4,6)
rownames(x)<-c("seq1","seq2","seq3","seq4") 
x<-as.dna(x)
# original character matrix 
as.matrix(x) 

## Coercing a 'Dna' object to a numeric matrix.
# numeric matrix
as.numeric(x)




