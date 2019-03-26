library(phylosim)


### Name: getSizes.DiscreteInsertor
### Title: Get the sizes of the proposed insertions
### Aliases: getSizes.DiscreteInsertor DiscreteInsertor.getSizes
###   getSizes,DiscreteInsertor-method

### ** Examples

       # create a DiscreteInsertor object
       i<-DiscreteInsertor(rate=1)
       # set insertion sizes    
       setSizes(i,c(1,2,3))
       # get insertion sizes
       getSizes(i)
       # set/get sizes via virtual field
       i$sizes<-1:10
       i$sizes
 


