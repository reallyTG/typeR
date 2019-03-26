library(galgo)


### Name: newCollection.Chromosome
### Title: Generates a list of chromosomes cloning the original chromosome
###   object
### Aliases: newCollection.Chromosome Chromosome.newCollection
###   newCollection.Chromosome newCollection,Chromosome-method
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   # list of two new identical Chromosome objects (different id)
   newCollection(cr, 2)                
   ni <- Niche(chromosomes = newCollection(cr, 2))
   ni # same genes values, different objects
   generateRandom(ni)
   ni # different genes values
 
   # creation and random generation at the same time
   ni <- Niche(chromosomes = newRandomCollection(cr, 2))
   ni
 


