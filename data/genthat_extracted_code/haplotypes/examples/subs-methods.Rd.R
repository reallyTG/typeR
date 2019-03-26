library(haplotypes)


### Name: subs-methods
### Title: Displays base substitutions
### Aliases: subs subs-methods subs,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples

data("dna.obj")
x<-dna.obj

## Base substitutions.
subs(x)

## Gaps are treated as a fifth state character.
subs(x,fifth=TRUE)




