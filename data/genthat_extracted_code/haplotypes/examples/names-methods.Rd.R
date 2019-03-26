library(haplotypes)


### Name: names-methods
### Title: Function to get or set names of a 'Dna' object
### Aliases: names names-methods names<--methods names,Dna-method
###   names<-,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples


data("dna.obj")

x<-dna.obj
x<-as.dna(x[1:4,1:6])

## Getting sequence names.
names(x)

## Setting sequence names.
names(x)<-c("u","v","z","y")
names(x)




