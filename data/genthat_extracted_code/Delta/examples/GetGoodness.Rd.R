library(Delta)


### Name: GetGoodness
### Title: Calculate Goodness of fit function
### Aliases: GetGoodness print.GetGoodness
### Keywords: Delta Goodness Pi mx

### ** Examples

GetGoodness(mx = matrix(c(1,0,0,0,2,0,0,0,3),3,3), Delta = c(1,1,1), Pi = NULL)
GetGoodness(mx = matrix(c(1.5,2.5,0.5,3.5,4.5,0.5,0.5,0.5,1.5),3,3), 
            Delta = c(-0.2662395,  0.2047577,  0.5664672), 
            Pi = c(0.42564365, 0.49700867, 0.07734769))
GetGoodness(mx = matrix(c(60,0,3,2,50,1,3,2,79),3,3), 
            Delta = c( 0.8945724, 0.9522836, 0.8962094), 
            Pi = c( 0.2703707, 0.1939561, 0.5356732))



