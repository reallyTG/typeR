library(TripleR)


### Name: RR.style
### Title: Set labeling styles for RR analyses
### Aliases: RR.style

### ** Examples

data("likingLong")

RR.style("behavior")
RR(liking_a ~ perceiver.id*target.id, data=likingLong)

RR.style("p")	# a "p" is enough for "perception"
RR(liking_a ~ perceiver.id*target.id, data=likingLong)




