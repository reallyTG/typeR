library(evt0)


### Name: other.EVI
### Title: Other extreme value index estimates
### Aliases: other.EVI mo gh mm
### Keywords: moment generalized Hill mixed moment

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1/0.5)

# estimate EVI 
other.EVI(x,c(500,5000,40000),"MO")




