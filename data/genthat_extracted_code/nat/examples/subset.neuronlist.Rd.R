library(nat)


### Name: subset.neuronlist
### Title: Subset neuronlist returning either new neuronlist or names of
###   chosen neurons
### Aliases: subset.neuronlist

### ** Examples

da1pns=subset(Cell07PNs,Glomerulus=='DA1')
with(da1pns,stopifnot(all(Glomerulus=='DA1')))
gammas=subset(kcs20,type=='gamma')
with(gammas,stopifnot(all(type=='gamma')))
# define a function that checks whether a neuron has points in a region in 
# space, specifically the tip of the mushroom body alpha' lobe
aptip<-function(x) {xyz=xyzmatrix(x);any(xyz[,'X']>350 & xyz[,'Y']<40)}
# this should identify the alpha'/beta' kenyon cells only
apbps=subset(kcs20,filterfun=aptip)
# look at which neurons are present in the subsetted neuronlist
head(apbps)
# combine global variables with dataframe columns
odds=rep(c(TRUE,FALSE),10)
stopifnot(all.equal(subset(kcs20,type=='gamma' & odds),
            subset(kcs20,type=='gamma' & rep(c(TRUE,FALSE),10))))
## Not run: 
##D # make a 3D selection function using interactive rgl::select3d() function
##D s3d=select3d()
##D # Apply a 3D search function to the first 100 neurons in the neuronlist dataset
##D subset(dps[1:100],filterfun=function(x) {sum(s3d(xyzmatrix(x)))>0},
##D   rval='names')
##D # combine a search by metadata, neuropil location and 3D location
##D subset(dps, Gender=="M" & rAL>1000, function(x) sum(s3d(x))>0, rval='name')
##D # The same but specifying indices directly, which can be considerably faster
##D # when neuronlist is huge and memory is in short supply
##D subset(dps, names(dps)[1:100],filterfun=function(x) {sum(s3d(xyzmatrix(x)))>0},
##D   rval='names')
## End(Not run)



