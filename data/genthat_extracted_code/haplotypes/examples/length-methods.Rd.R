library(haplotypes)


### Name: length-methods
### Title: Methods for function 'length' in the package 'haplotypes'
### Aliases: length length-methods length,Dna-method
###   length,Haplotype-method length,Parsimnet-method
### Keywords: DNA ANALYSIS HAPLOTYPE ANALYSIS STATISTICAL PARSIMONY

### ** Examples

data("dna.obj")
x<-dna.obj

## Longest sequence length
length(x)


## Total number of haplotypes
h<-haplotype(x)
length(h)

## Length of network(s)
p<-parsimnet(x,prob=.95)
# length of the network
length(p)
 
p<-parsimnet(x,prob=.99)
# length of the networks
length(p)




