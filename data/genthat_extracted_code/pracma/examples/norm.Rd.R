library(pracma)


### Name: Norm
### Title: Vector Norm
### Aliases: Norm
### Keywords: array

### ** Examples

Norm(c(3, 4))          #=> 5  Pythagoras triple
Norm(c(1, 1, 1), p=2)  #   sqrt(3)
Norm(1:10, p = 1)      #   sum(1:10)
Norm(1:10, p = 0)      #   Inf
Norm(1:10, p = Inf)    #   max(1:10)
Norm(1:10, p = -Inf)   #   min(1:10)



