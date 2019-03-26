library(BAMMtools)


### Name: subtreeBAMM
### Title: Pulls out a subtree from 'bammdata' object
### Aliases: subtreeBAMM
### Keywords: graphics

### ** Examples

data(whales, events.whales)
ephy <- getEventData(whales, events.whales, burnin=0.25, nsamples=500)

# specify a set of tips for the subtree
tips <- sample(ephy$tip.label,size=20,replace=FALSE)
subphy <- subtreeBAMM(ephy,tips=tips)

# specify a innernode for subsetting
subphy <- subtreeBAMM(ephy,node=103)

# plot the subtree
plot(subphy)



