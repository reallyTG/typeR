library(galgo)


### Name: generateRandom.Gene
### Title: Generates a random value from the defined function
### Aliases: generateRandom.Gene Gene.generateRandom generateRandom.Gene
###   generateRandom,Gene-method
### Keywords: methods internal methods

### ** Examples

   ge <- Gene(shape1=1, shape2=100)
   ge
   generateRandom(ge)
   generateRandom(ge)
   generateRandom(ge)

   # generation that depends on initial random selection ==> "is it silly?"
   ge$generateFunc = function(g, n=1, sh1, sh2) {
      if (is.null(g$value)) {
          g$value <- runif(n, sh1, sh2)
          g$value
      } else {
          g$value + runif(n, min=-10, max=10)
      }
   }
 
   generateRandom(ge)
   generateRandom(ge)
   generateRandom(ge)
 


