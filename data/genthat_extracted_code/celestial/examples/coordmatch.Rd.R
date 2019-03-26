library(celestial)


### Name: Sky Coordinate Matching
### Title: Sky matching
### Aliases: coordmatch coordmatchsing
### Keywords: match matching coord coordinates

### ** Examples

set.seed(666)

#Here we make objects in a virtual 1 square degree region

mocksky=cbind(runif(1e3), runif(1e3))

#Now we match to find all objects within an arc minute, ignoring self matches

mockmatches=coordmatch(mocksky, mocksky, ignoreexact=TRUE, rad=1, radunit='amin')

#Now we match to find all objects with varying match radii, ignoring self matches

mockmatchesvary=coordmatch(mocksky, mocksky,ignoreexact=TRUE, rad=seq(0,1,length=1e3),
radunit='amin')



