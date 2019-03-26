library(riverdist)


### Name: mouthdist
### Title: Distance From Mouth
### Aliases: mouthdist

### ** Examples

data(Gulk)

# Mouth must be specified
Gulk$mouth$mouth.seg <- 1
Gulk$mouth$mouth.vert <- 1

mouthdist(seg=4, vert=40, rivers=Gulk)
mouthdist(seg=c(4,5), vert=c(40,20), rivers=Gulk)



