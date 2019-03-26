library(gld)


### Name: starship
### Title: Carry out the "starship" estimation method for the generalised
###   lambda distribution
### Aliases: starship
### Keywords: distribution

### ** Examples

data <- rgl(100,0,1,.2,.2)
starship(data,optim.method="Nelder-Mead",initgrid=list(lcvect=(0:4)/10,
ldvect=(0:4)/10))



