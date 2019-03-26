library(phylosim)


### Name: setSizes.DiscreteInsertor
### Title: Set the sizes of the proposed insertions
### Aliases: setSizes.DiscreteInsertor DiscreteInsertor.setSizes
###   setSizes,DiscreteInsertor-method

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
 


