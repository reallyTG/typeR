library(rpnf)


### Name: getLogBoxsize
### Title: Determine an appropriate boxsize, if you want to use logarithmic
###   scale.
### Aliases: getLogBoxsize

### ** Examples

# apply it with pnfprocessor
library(rpnf) # Load rpnf library
data(DOW) # Load some example data

# return appropriate value for 1% boxsize
getLogBoxsize(percent=1)

pnfprocessor(
 high=DOW$High,
 low=DOW$Low,
 date=DOW$Date,
 boxsize=getLogBoxsize(percent=1),
 log=TRUE)



