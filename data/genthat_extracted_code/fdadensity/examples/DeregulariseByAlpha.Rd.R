library(fdadensity)


### Name: DeregulariseByAlpha
### Title: Function to deregularise densities to have (smaller) minimum
###   value
### Aliases: DeregulariseByAlpha

### ** Examples


 x = seq(0,1,length.out=122)
 y = seq(0.1,1.9,length.out=122)
 z = DeregulariseByAlpha(x=x, y=y, alpha = 0)
 



