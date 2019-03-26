library(marmap)


### Name: collate.bathy
### Title: Collates two bathy matrices with data from either sides of the
###   antimeridian
### Aliases: collate.bathy

### ** Examples

## faking two datasets using aleutians, for this example
## "a" and "b" simulate two datasets downloaded from GEBCO, for ex.
	data(aleutians)
	aleutians[1:181,] -> a ; "bathy" -> class(a)
	aleutians[182:601,] -> b ; "bathy" -> class(b)
	-(360-as.numeric(rownames(b))) -> rownames(b) 

## check these objects with summary(): pay attention of the Longitudinal range
	summary(aleutians)
	summary(a)
	summary(b)

## merge datasets:
	collate.bathy(a,b) -> collated
	summary(collated) # should be identical to summary(aleutians)



