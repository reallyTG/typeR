library(spatstat)


### Name: split.ppp
### Title: Divide Point Pattern into Sub-patterns
### Aliases: split.ppp split<-.ppp
### Keywords: spatial methods manip

### ** Examples


# (1) Splitting by marks

# Multitype point pattern: separate into types
 u <- split(amacrine)

# plot them
 plot(split(amacrine))

# the following are equivalent:
 amon <- split(amacrine)$on
 amon <- unmark(amacrine[amacrine$marks == "on"])
 amon <- subset(amacrine, marks == "on", -marks)
   
# the following are equivalent:
 amon <- split(amacrine, un=FALSE)$on
 amon <- amacrine[amacrine$marks == "on"]
   
# Scramble the locations of the 'on' cells
 X <- amacrine
 u <- split(X)
 u$on <- runifpoint(ex=amon)
 split(X) <- u

# Point pattern with continuous marks
 trees <- longleaf
 ## Don't show: 
	# smaller dataset
	trees <- trees[seq(1, npoints(trees), by=80)]
 
## End(Don't show)
 # cut the range of tree diameters into three intervals
 # using cut.ppp
 long3 <- cut(trees, breaks=3)
 # now split them
 long3split <- split(long3)

# (2) Splitting by a factor

# Unmarked point pattern
  swedishpines
# cut & split according to nearest neighbour distance
  f <- cut(nndist(swedishpines), 3)
  u <- split(swedishpines, f)

# (3) Splitting over a tessellation
   tes <- tess(xgrid=seq(0,96,length=5),ygrid=seq(0,100,length=5))
   v <- split(swedishpines, tes)


# (4) how to apply an operation to selected points:
#  split into components, transform desired component, then un-split
#  e.g. apply random jitter to 'on' points only
  X <- amacrine
  Y <- split(X)
  Y$on <- rjitter(Y$on, 0.1)
  split(X) <- Y



