library(galgo)


### Name: generateRandom.Niche
### Title: Generates random values for all genes contained in all
###   chromosomes in the niche
### Aliases: generateRandom.Niche Niche.generateRandom generateRandom.Niche
###   generateRandom,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  ni2 <- ni
  generateRandom(ni2)
  ni2
  ni			# ni and ni2 are the very same object
  ni3 <- clone(ni2)
  generateRandom(ni3)
  ni3
  ni2			# now cr2 is different to cr3
  ni			# but cr2 is still the same than cr



