library(fso)


### Name: step.mfso
### Title: Step-Wise Forward Variable Selection in a Multivariate Fuzzy Set
###   Ordination
### Aliases: step.mfso
### Keywords: multivariate

### ** Examples

	## Not run: require(labdsv) # make data available
        ## Not run: data(bryceveg)  # get vegetation data
        ## Not run: data(brycesite) # get environmental data
        ## Not run: dis.bc <- dsvdis(bryceveg,'bray.curtis') # produce dist object
        ## Not run: attach(brycesite)   # make variables easily available
        ## Not run: step.mfso(dis.bc,start=NULL,add=data.frame(elev,slope,av))
        ## Not run: step.mfso(dis.bc,start=data.frame(elev),add=data.frame(slope,av))



