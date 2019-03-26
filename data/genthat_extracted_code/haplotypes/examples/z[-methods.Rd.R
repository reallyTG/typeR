library(haplotypes)


### Name: [-methods
### Title: Extract or replace parts of an object of class 'Dna'
### Aliases: [-methods [,Dna-method [<-,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples


data("dna.obj")
x<-dna.obj

## Extract parts.
# a matrix object
x[1:2,1:3]

# a Dna object, as.dna(x[1:2,1:3]) gives the same result
x[1:2,1:3,as.matrix=FALSE] 
  
## Replace parts.
#"G" "C"
x[1,1:2] 	
x[1,1:2]<-c("A","T")
x[1,1:2]






