library(haplotypes)


### Name: polymorp-methods
### Title: Displays polymorphic sites (base substitutions and indels)
###   between two sequences
### Aliases: polymorp polymorp-methods polymorp,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples

data("dna.obj")
x<-dna.obj

## Showing base substitutions and indels between seq1 and seq6.

# gaps are coded following the simple indel coding method
polymorp(x,c(1,6),indels="s")

# gaps are coded as a fifth state character
polymorp(x,c(1,6),indels="5")

# gaps are treated as missing character 
polymorp(x,c(1,6),indels="m")





