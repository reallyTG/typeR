library(HistDAWass)


### Name: register
### Title: Method 'register'
### Aliases: register register,distributionH,distributionH-method
###   register,distributionH-method
### Keywords: distribution

### ** Examples


##---- initialize two distributionH objects mydist1 and mydist2
 mydist1=distributionH(c(1,2,3),c(0, 0.4, 1))
 mydist2=distributionH(c(7,8,10,15),c(0, 0.2, 0.7, 1))
 ## register the two distributions
 regDist=register(mydist1,mydist2)
 
## OUTPUT:
## regDist$[[1]]
## An object of class "distributionH"
## Slot "x": [1] 1.0 1.5 2.0 2.5 3.0
## Slot "p": [1] 0.0 0.2 0.4 0.7 1.0
## ...
## regDist$[[2]] 
## An object of class "distributionH"
## Slot "x": [1] 7.0 8.0 8.8 10.0 15.0
## Slot "p": [1] 0.0 0.2 0.4  0.7  1.0
## ...



