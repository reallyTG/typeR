library(galgo)


### Name: newRandomCollection.Gene
### Title: Generates a list of cloned objects and random values
### Aliases: newRandomCollection.Gene Gene.newRandomCollection
###   newRandomCollection.Gene newRandomCollection,Gene-method
### Keywords: methods internal methods

### ** Examples

   ge <- Gene(shape1=1, shape2=100)
   ge
   print(ge)
   # list of five new different Gene objects
   newRandomCollection(ge, 5)
   # list of two new different Gene objects converted to a list using unObject
   unObject(newRandomCollection(ge,2))
 
   # building chromosome from gene clones
   # (perhaps for variable selection in microarray data)
   cr <- Chromosome(genes=newRandomCollection(ge, 5))
   cr
 


