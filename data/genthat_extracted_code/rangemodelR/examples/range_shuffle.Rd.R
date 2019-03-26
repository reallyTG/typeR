library(rangemodelR)


### Name: range_shuffle
### Title: Range shuffle models for for range extents reccorded along
###   gradients
### Aliases: range_shuffle

### ** Examples

data(rangedata)
range_shuffle_rnd <- range_shuffle(x=rangedata,boundary = 'hh',
                                   interval = 200, var = NULL,
                                   sites = seq(600,2400,200),
                                   reps =10,degen = FALSE)
range_shuffle_rnd
plot(range_shuffle_rnd$mean,ylab = "Species Richness",pch = 19)



