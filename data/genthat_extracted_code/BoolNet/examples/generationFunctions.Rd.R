library(BoolNet)


### Name: generationFunctions
### Title: Generation functions for biologically relevant function classes
### Aliases: generateCanalyzing generateNestedCanalyzing
### Keywords: canalyzing function nested canalyzing function, random
###   network

### ** Examples

  # generate a random network with canalyzing functions
  net1 <- generateRandomNKNetwork(n=10, k=5, 
                                  functionGeneration="generateCanalyzing")
  print(net1)
                                  
  # generate a random network with nested canalyzing functions
  net2 <- generateRandomNKNetwork(n=10, k=5, 
                                  functionGeneration="generateNestedCanalyzing")
  print(net2)                                  



