library(DDHFm)


### Name: simdurbin2
### Title: Gene intensities simulator
### Aliases: simdurbin2
### Keywords: datagen

### ** Examples

#
# Generate data with mu equal to 80 and mu equal to 80000 with 10 replicates each
#
#
v <- simdurbin2( c(rep(80, 10), rep(80000,10)), alpha=24800, seta=0.227, seps=4800)
#
# Let's look at the mean of the first 10 and the last 10
#
mean(v[1:10])
#[1] 27361.95
#
mean(v[11:20])
#[1] 92455.66



