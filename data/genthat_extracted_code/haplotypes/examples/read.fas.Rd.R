library(haplotypes)


### Name: read.fas
### Title: Read sequences from a file in FASTA format
### Aliases: read.fas
### Keywords: DNA ANALYSIS

### ** Examples


##Reading example file.	
f<-system.file("example.fas",package="haplotypes")
 
# invalid character 'N' was replaced with '?' with a warning message
x<-read.fas(file=f) 

# an object of class 'Dna'
x




