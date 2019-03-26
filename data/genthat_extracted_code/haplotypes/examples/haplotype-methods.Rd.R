library(haplotypes)


### Name: haplotype-methods
### Title: Methods for function 'haplotype' in the package 'haplotypes'
### Aliases: haplotype haplotype-methods haplotype,Dna-method
###   haplotype,dist-method haplotype,matrix-method
### Keywords: HAPLOTYPE ANALYSIS

### ** Examples

	
data("dna.obj")
x<-dna.obj[1:6,,as.matrix=FALSE]

##Inferring haplotypes using 'Dna' object.
# coding gaps using simple indel coding method
h<-haplotype(x,indels="sic")
h

# giving DNA sequences of haplotypes
as.dna(h) 

## Not run: 
##D 	
##D ## Slots of an object Haplotype	
##D h@haplist  #haplotype list (names)
##D h@hapind  #haplotype list (index)
##D h@uniquehapind  #getting index of the first occurrence of haplotypes
##D h@sequence  #DNA sequences of haplotypes
##D h@d  #distance matrix of haplotypes
##D h@freq  #haplotype frequencies
##D h@nhap  #total number of haplotypes
## End(Not run)

## Inferring haplotypes using dist object. 
d<-distance(x)
h<-haplotype(d) 
h
## Not run: 
##D # returns an error message 
##D as.dna(h)
## End(Not run) 

## Inferring haplotypes using distance matrix.
d<-as.matrix(distance(x))
h<-haplotype(d) 
h
## Not run: 
##D # returns an error message
##D as.dna(h)
## End(Not run)  




