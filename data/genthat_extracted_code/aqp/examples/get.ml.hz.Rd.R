library(aqp)


### Name: get.ml.hz
### Title: Determine ML Horizon Boundaries
### Aliases: get.ml.hz
### Keywords: manip

### ** Examples

data(sp1)
depths(sp1) <- id ~ top + bottom

# normalize horizon names: result is a factor
sp1$name <- generalize.hz(sp1$name, 
  new=c('O','A','B','C'), 
  pat=c('O', '^A','^B','C'))

# compute slice-wise probability so that it sums to contributing fraction, from 0-150
a <- slab(sp1, fm= ~ name, cpm=1, slab.structure=0:150)

# generate table of ML horizonation
get.ml.hz(a)



