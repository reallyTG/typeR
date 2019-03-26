library(phylosim)


### Name: getProbs.DiscreteInsertor
### Title: Get the insertion length probabilities
### Aliases: getProbs.DiscreteInsertor DiscreteInsertor.getProbs
###   getProbs,DiscreteInsertor-method

### ** Examples

       # create a DiscreteInsertor object
       i<-DiscreteInsertor(rate=1, sizes=1:3)
       # set/get length probabilities
       setProbs(i,c(1/3,1/3,1/3)) # equal probabilites
       getProbs(i)
       # set/get length probabilities via virtual field
       x<-c(2,2,1)
       # normalize x
       x<-x/sum(x)
       i$probs<-x
       i$probs
 


