library(RDS)


### Name: get.wave
### Title: Calculates the depth of the recruitment tree (i.e. the
###   recruitment wave) at each node.
### Aliases: get.wave

### ** Examples

data(fauxmadrona)
#number subjects in each wave
w <- get.wave(fauxmadrona)
#number recruited in each wave
barplot(table(w))



