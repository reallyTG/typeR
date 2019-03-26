library(ramps)


### Name: genUSStateGrid
### Title: Generating a Grid over a US State
### Aliases: genUSStateGrid
### Keywords: datagen utilities

### ** Examples

mygrid <- genUSStateGrid('iowa', resolution=c(8, 4))
map('state', 'iowa')
points(mygrid)



