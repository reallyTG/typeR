library(PASWR)


### Name: satfruit
### Title: Fruit Trees
### Aliases: satfruit
### Keywords: datasets

### ** Examples

with(data = satfruit, 
pairs(satfruit[,15:17]))
# Trellis Approach
splom(~data.frame(satfruit[,15:17]), data = satfruit)



