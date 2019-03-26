library(galgo)


### Name: generateRandom.Chromosome
### Title: Generates random values for all genes in the chromosome
### Aliases: generateRandom.Chromosome Chromosome.generateRandom
###   generateRandom.Chromosome generateRandom,Chromosome-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  #
  # from clone example
  cr2 <- cr
  generateRandom(cr2)
  cr2
  cr			# cr and cr2 are the very same object
  cr3 <- clone(cr2)
  generateRandom(cr3)
  cr3
  cr2			# now cr2 is different to cr3
  cr			# but cr2 is still the same than cr



