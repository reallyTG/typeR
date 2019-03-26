library(popbio)


### Name: generation.time
### Title: Generation time
### Aliases: generation.time
### Keywords: survey

### ** Examples

data(whale)
generation.time(whale)
## fertilities in last column
data(teasel)
generation.time(teasel, r=1:6, c=6)
## Plot 3 from Calathea 
data(calathea)
sapply(calathea[9:12], generation.time)



