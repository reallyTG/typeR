library(haplotypes)


### Name: haplotypes-package
### Title: Haplotype inference and statistical analysis of genetic
###   variation
### Aliases: haplotypes-package haplotypes
### Keywords: PACKAGE

### ** Examples


## Read example FASTA file.	
f<-system.file("example.fas",package="haplotypes") 
# invalid character 'N' was replaced with '?' with a warning message
x<-read.fas(file=f)
# an object of class 'Dna'
x 

## or load DNA Sequence data set.
data("dna.obj") 
x<-dna.obj
## Not run: 
##D x
## End(Not run)

## Compute an absolute pairwise character difference matrix from DNA sequences.
# coding gaps using simple indel coding method
d<- distance(x,indels="sic") 
## Not run: 
##D d
## End(Not run)

## Infer haplotypes using the 'Dna' object.
# coding gaps using simple indel coding method
h<-haplotype(x,indels="s") 
## Not run: 
##D h
## End(Not run)

## Conduct statistical parsimony analysis with %95 connection limit.
p<-parsimnet(x,prob=.95) 

## Not run: 
##D p
##D # plot network
##D plot(p) 
## End(Not run)



