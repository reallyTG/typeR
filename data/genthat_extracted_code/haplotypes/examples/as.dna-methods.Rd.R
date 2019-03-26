library(haplotypes)


### Name: as.dna-methods
### Title: Coerces an object to a 'Dna' object
### Aliases: as.dna as.dna-methods as.dna,matrix-method
###   as.dna,data.frame-method as.dna,list-method as.dna,Haplotype-method
### Keywords: DNA ANALYSIS

### ** Examples


## Coercing a matrix to a 'Dna' object.
# all valid characters
x<-matrix(c("?","A","C","g","t","-","0","1","2","3","4","5"),4,6)
rownames(x)<-c("seq1","seq2","seq3","seq4") 
dna.obj<-as.dna(x) 
dna.obj
# the sequence matrix
dna.obj@sequence

## Not run: 
##D # includes invalid characters
##D x<-matrix(c("X","y","*","?","t","-","0","1","2","3","4","5"),4,6) 
##D rownames(x)<-c("seq1","seq2","seq3","seq4") 
##D dna.obj<-as.dna(x) 
##D dna.obj
##D dna.obj@sequence
##D 
##D # all valid integers
##D x<-matrix(c(0,1,2,3,4,5,0,1,2,3,4,5),4,6) 
##D rownames(x)<-c("seq1","seq2","seq3","seq4") 
##D dna.obj<-as.dna(x) 
##D dna.obj
##D dna.obj@sequence
##D 
##D ## Coercing a data.frame to a 'Dna' object.
##D x<-data.frame(matrix(c("?","A","C","g","t","-","0","1","2","3","4","5"),4,6)) 
##D rownames(x)<-c("seq1","seq2","seq3","seq4") 
##D dna.obj<-as.dna(x) 
##D dna.obj
##D dna.obj@sequence
##D 
##D ## Coercing a list to a 'Dna' object.
##D seq1<-c("?","A","C","g","t","-","0","1")
##D seq2<-c("?","A","C","g","t","-","0","1","2")
##D seq3<-c("?","A","C","g","t","-","0","1","2","3")
##D x<-list(seq1=seq1,seq2=seq2,seq3=seq3) 
##D dna.obj<-as.dna(x)
##D 
##D # sequence lengths differ 
##D dna.obj@seqlengths
##D dna.obj@sequence
##D 
##D ## Coercing a Haplotype object to a Dna object.
##D data("dna.obj")
##D x<-dna.obj
##D h<-haplotype(x)
##D 
##D # DNA Sequences of unique haplotypes  
##D dna.obj<-as.dna(h)
##D dna.obj
##D 
##D d<-distance(x)
##D 
##D # if 'Haplotype' object does not contain 'DNA' Sequences
##D h<-haplotype(d)
##D 
##D # returns an error
##D as.dna(h)
## End(Not run)



