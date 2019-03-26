library(galgo)


### Name: clone.Niche
### Title: Clones itself and its chromosomes
### Aliases: clone.Niche Niche.clone clone.Niche clone,Niche-method
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
  ni2			# now ni2 is different to ni3
  ni			# but ni2 is still the same than ni



