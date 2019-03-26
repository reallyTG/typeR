library(aqp)


### Name: generalize.hz
### Title: Generalize Horizon Names
### Aliases: generalize.hz
### Keywords: manip

### ** Examples

data(sp1)

# check original distribution of hz designations
table(sp1$name)

# generalize
sp1$genhz <- generalize.hz(sp1$name, 
new=c('O','A','B','C','R'), 
pat=c('O', '^A','^B','C','R'))

# see how we did / what we missed
table(sp1$genhz, sp1$name)



