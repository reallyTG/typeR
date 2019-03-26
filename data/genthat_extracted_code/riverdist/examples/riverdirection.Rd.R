library(riverdist)


### Name: riverdirection
### Title: River Direction
### Aliases: riverdirection

### ** Examples

data(Gulk)

# Mouth must be specified
Gulk$mouth$mouth.seg <- 1
Gulk$mouth$mouth.vert <- 1

plot(x=Gulk)
riverdirection(startseg=6, endseg=3, startvert=40, endvert=40, rivers=Gulk)



