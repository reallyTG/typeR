library(galgo)


### Name: genes.Chromosome
### Title: Converts the genes values to a numeric vector
### Aliases: genes.Chromosome Chromosome.genes genes.Chromosome
###   genes,Chromosome-method genes
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  genes(cr)
  # the output is the same, the print method uses genes method.



