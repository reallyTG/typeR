library(frontier)


### Name: resettestFrontier
### Title: RESET test for Stochastic Frontier Models
### Aliases: resettestFrontier
### Keywords: models

### ** Examples

   # load data set
   data( front41Data )

   # estimate a Cobb-Douglas production frontier
   cobbDouglas <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data )
   
   # conduct the RESET test
   resettestFrontier( cobbDouglas )



