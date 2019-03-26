library(galgo)


### Name: newCollection.Gene
### Title: Generates a list of cloned objects
### Aliases: newCollection.Gene Gene.newCollection newCollection.Gene
###   newCollection,Gene-method
### Keywords: methods internal methods

### ** Examples

   ge <- Gene(shape1=1, shape2=100)
   ge
   print(ge)
   # list of five new identical Gene objects (different id)
   newCollection(ge, 5)                
   # list of two new identical Gene objects converted to a list using unObject
   unObject(newCollection(ge,2))       
 
   # building chromosome from gene clones
   # (perhaps for variable selection in microarray data)
   cr <- Chromosome(genes=newCollection(ge, 5))
   cr
 


