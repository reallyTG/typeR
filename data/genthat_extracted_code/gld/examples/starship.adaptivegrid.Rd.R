library(gld)


### Name: starship.adaptivegrid
### Title: Carry out the "starship" estimation method for the generalised
###   lambda distribution using a grid-based search
### Aliases: starship.adaptivegrid
### Keywords: distribution

### ** Examples

data <- rgl(100,0,1,.2,.2)
starship.adaptivegrid(data,list(lcvect=(0:4)/10,ldvect=(0:4)/10))



